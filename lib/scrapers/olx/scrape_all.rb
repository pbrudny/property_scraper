module Scrapers
  module Olx
    class ScrapeAll
      def initialize
        self.url = 'https://www.olx.pt/imoveis/apartamento-casa-a-venda/apartamentos-arrenda/encarnazao/?search%5Bfilter_enum_tipologia%5D%5B0%5D=t1&search%5Bfilter_enum_tipologia%5D%5B1%5D=t2&search%5Bdescription%5D=1'
      end

      def call
        (1..2).each do |page_index|
          ads_links(page_index).each do |link|
            puts "Adding link #{link}"
            parser = Parser.new(link)
            create_ad(parser, link)
          end
        end
      end

      private

      attr_accessor :url

      def url_with_page(page_index)
        url << "&page=#{page_index}"
      end

      def ads_links(page_index)
        html_data = open(url_with_page(page_index))
        nokogiri_object = Nokogiri::HTML(html_data)
        @ads_links ||= nokogiri_object.xpath('//h3[@class="x-large lheight20 margintop5"]/a/@href')
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
    end
  end
end

# require 'scrapers/olx_scraper'
# Scrapers::Olx::ScrapeAll.new.call
