require 'scrapers/olx_scraper'

namespace :scraper do
  desc 'Scrape property ads from OLX'
  task scrape_olx: :environment do
    Scrapers::OlxScraper.new.call
  end

end
