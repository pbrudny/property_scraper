require 'scrapers/olx/scraper'

module Ads
  class LoadAds
    def initialize
      self.search_links = SearchLink.all
      self.load = Load.create
    end

    def call
      # TODO: load could replace new_ads
      new_ads = search_links.map { |link| [link.name, scraped_new_ads(link) ] }
      notify_about_new(new_ads) if new_ads?(new_ads)
    end

    private

    attr_accessor :search_links, :load

    def notify_about_new(new_ads)
      AdMailer.new_ads(new_ads).deliver_now
    end

    def scraped_new_ads(search_link)
      Scrapers::Olx::ScrapeAll.new(search_link, load).call
    end

    def new_ads?(new_ads)
      ads_count(new_ads) > 0
    end

    def ads_count(ads)
      ads.flatten.count - ads.count
    end
  end
end
