namespace :scraper do
  desc 'Scrape property ads from OLX'
  task scrape_olx: :environment do
    Ads::LoadAds.new.call
  end

end
