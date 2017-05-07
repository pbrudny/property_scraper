module Scrapers
  module Olx
    class ScrapeAll
      def initialize
        self.url = Site.find_by(title: 'Olx').url
      end

      def call
        (1..2).each do |page_index|
          puts "Page: #{page_index}"
          ads_links(page_index).each do |link|
            if Ad.find_by(url: link.value).present?
              puts "Link existed! #{link.value}"
            else
              puts "Adding link #{link}"
              create_ad(Parser.new(link, agent), link)
            end
          end
        end
      end

      private

      attr_accessor :url

      def url_with_page(page_index)
        "#{url}&page=#{page_index}"
      end

      def ads_links(page_index)
        html_data = open(url_with_page(page_index))
        nokogiri_object = Nokogiri::HTML(html_data)
        nokogiri_object.xpath('//h3[@class="x-large lheight20 margintop5"]/a/@href')
      end

      def create_ad(parser, link)
        Ad.create(
          title: parser.title,
          url: link,
          phone: parser.phone_number,
          price: parser.price,
          district: District.last,
          offer_id: parser.offer_id,
          tipologia: 'T1',
          description: parser.description,
          publicated_at: parser.publicated_at,
          image_path: 'TODO',
          location: parser.location
        )
      end

      def agent
        @agent ||= Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' }
      end
    end
  end
end

# require 'scrapers/olx_scraper'
# Scrapers::Olx::ScrapeAll.new.call
