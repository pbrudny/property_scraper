require 'selenium-webdriver'

namespace :scraper do
  desc 'Scrape property ads from OLX'
  task scrape_olx: :environment do
    Ads::LoadAds.new.call
  end

  task scrape_selenium: :environment do
    puts '* opening chrome'
    # driver = Selenium::WebDriver.for :chrome
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)
    wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    puts '* going to site'
    phone = nil
    wait.until do
      driver.navigate.to "https://www.olx.pt/anuncio/prdio-em-alfama-recuperado-IDAI9RD.html#aee626cf86"
      puts '* finding number button'
      button = wait.until { driver.find_element(:xpath, "//div[span[contains(text(), 'Ver número')]/..]") }
      puts '* click on number button'
      button.click
      phone = driver.find_element(:xpath, "//strong[contains(@class,'xx-large') and contains(@class, 'fnormal')]")
    end
    phone_number = phone.text
    puts phone_number
    if phone_number.include?('xxx')
      sleep 1
      phone = driver.find_element(:xpath, "//strong[contains(@class,'xx-large') and contains(@class, 'fnormal')]")
    end
    phone_number = phone.text
    puts phone_number
  end
end

