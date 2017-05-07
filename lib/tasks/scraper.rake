require 'scrapers/olx/scrape_all'

namespace :scraper do
  desc 'Scrape property ads from OLX'
  task scrape_olx: :environment do
    Scrapers::Olx::ScrapeAll.new.call
  end

end
