require 'scrapers/olx/scraper'

module Ads
  class LoadAds
    def initialize
      self.search_links = SearchLink.all
    end

    def call
      new_ads = search_links.map { |link| [link.name, scraped_new_ads(link) ] }
      notify_about_new(new_ads)
    end

    private

    attr_accessor :search_links

    def notify_about_new(new_ads)
      AdMailer.new_ads(new_ads).deliver_now
    end

    def scraped_new_ads(search_link)
      Scrapers::Olx::ScrapeAll.new(search_link).call
    end
  end
end
