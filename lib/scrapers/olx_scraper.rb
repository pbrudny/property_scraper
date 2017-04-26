module Scrapers
  class OlxScraper
    def initialize
      self.url = 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/encarnazao/?search%5Bfilter_enum_tipologia%5D%5B0%5D=t1&search%5Bfilter_enum_tipologia%5D%5B1%5D=t2&search%5Bdescription%5D=1'
    end

    def call
      ads_links = []
      (1..2).each do |page_index|
        html_data       = open(url_with_page(page_index))
        nokogiri_object = Nokogiri::HTML(html_data)
        ads_links = nokogiri_object.xpath('//h3[@class="x-large lheight20 margintop5"]/a/@href')
        ads_links.each do |link|
          puts "Adding link #{link}"
          page     = agent.get(link.to_s)
          html_doc = Nokogiri::HTML(page.body, 'UTF-8')
          phone = get_phone_number(html_doc)
          Ad.create(url: link, phone: phone, district: District.last)
        end
      end
    end

    private

    attr_accessor :url

    def url_with_page(page_index)
      url << "&page=#{page_index}"
    end

    def agent
      @agent ||= Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' }
    end

    def get_phone_number(html_doc)
      phone_url = 'https://www.olx.pt/ajax/misc/contact/phone/'
      # This specific string contains an Ad's ID
      str  = html_doc.xpath('//*[@id="contact-form"]/@action').to_s
      # Extract the Ad's ID from the string
      id   = str[/-ID.+?.html/].to_s.gsub("-ID", "").gsub(".html", "")
      # Generate a link to get the phone number, example: https://www.olx.pt/ajax/misc/contact/phone/XYZWT/
      link = phone_url + id + "/"
      begin
        page = agent.get(link)
        return page.body.to_s[/([0-9]+\s?){3}/]
      rescue Exception => e
        page = e.page
        return nil
      end
    end
  end
end

#
# require 'scrapers/olx_scraper'
# Scrapers::OlxScraper.new.call
