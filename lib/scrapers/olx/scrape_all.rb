module Scrapers
  module Olx
    class ScrapeAll
      def initialize(search_link)
        self.search_link = search_link
        self.url = search_link.url
      end

      def call
        new_ads = []
        (1..2).each do |page_index|
          puts "Page: #{page_index}"
          ads_links(page_index).each do |link|
            if Ad.find_by(url: link.value).present?
              puts "Link existed! #{link.value}"
            else
              puts "Adding link #{link}"
              if (new_ad = create_ad(Scrapers::Olx::Parser.new(link, agent), link)).valid?
                new_ads << new_ad
              end
            end
          end
        end
        new_ads
      end

      private

      attr_accessor :url, :search_link

      def url_with_page(page_index)
        "#{url}&page=#{page_index}"
      end

      def ads_links(page_index)
        if (html_data = open(url_with_page(page_index))).present?
          nokogiri_object = Nokogiri::HTML(html_data)
          nokogiri_object.xpath('//h3[@class="x-large lheight20 margintop5"]/a/@href')
        end
      rescue OpenURI::HTTPError => ex
        []
      rescue
        raise "Make sure Search Link '#{search_link.name}' is OK. Problem opening url #{url_with_page(page_index)}. "
      end

      def create_ad(parser, link)
        search_link.ads.create(
          title: parser.title,
          url: link,
          phone: parser.phone_number,
          price: parser.price,
          district: District.first,
          offer_id: parser.offer_id,
          tipologia: 'T1',
          status: Status.first,
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
