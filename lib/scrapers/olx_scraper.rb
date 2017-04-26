module Scrapers
  class OlxScraper
    def initialize
      self.url = 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/encarnazao/?search%5Bfilter_enum_tipologia%5D%5B0%5D=t1&search%5Bfilter_enum_tipologia%5D%5B1%5D=t2&search%5Bdescription%5D=1'
    end
    #TODO: get the links from all pages
    #TODO: save new links into DB

    def call
      ads_links = []
      (1..4).each do |page_index|
        html_data       = open(url_with_page(page_index))
        nokogiri_object = Nokogiri::HTML(html_data)

        # get ad's links from the results page (link changes sometimes... =/ )
        ads_links << nokogiri_object.xpath('//h3[@class="x-large lheight20 margintop5"]/a/@href')

        # page = agent.get(url)
        # html_doc = Nokogiri::HTML(page.body, 'UTF-8')
      end
      ads_links
    end

    private

    attr_accessor :url

    def url_with_page(page_index)
      url << "&page=#{page_index}"
    end

    def agent
      @agent ||= Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' }
    end
  end
end

#
# require 'scrapers/olx_scraper'
# Scrapers::OlxScraper.new.call
