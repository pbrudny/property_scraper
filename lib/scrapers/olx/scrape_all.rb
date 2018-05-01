module Scrapers
  module Olx
    class ScrapeAll
      def initialize(search_link, load)
        self.search_link = search_link
        self.url = search_link.url
        self.load = load
        @problems = []
      end

      def call
        new_ads = []
        (1..2).each do |page_index|
          puts "Page: #{page_index}"
          ads_links(page_index).each do |link|
            if Ad.find_by(url: link.value).present?
              puts "Link existed! #{link.value}"
            else
             add_link(link, new_ads)
            end
          end
        end
        load.update_attribute(:errors_list, @problems)
        new_ads
      end

      private

      attr_accessor :url, :search_link, :load

      def add_link(link, new_ads)
        puts "Adding link #{link}"
        parser = Scrapers::Olx::Parser.new(link, agent)
        if (new_ad = create_ad(parser, link)).valid?
          new_ads << new_ad
        else
          @problems << ["Scraping #{link.value} with AR errors: #{new_ad.errors.full_messages} "]
        end
      rescue => e
        puts " Scraping #{link.value} with errors: #{e} "
        @problems << ["Scraping #{link.value} with errors: #{e} "]
      end

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
        raise 'OFFER MISSING!' if parser.offer_id.nil?

        search_link.ads.create(
          offer_id: parser.offer_id,
          title: parser.title,
          url: link,
          phone: parser.phone_number,
          price: parser.price,
          district: District.first,
          tipologia: 'T1',
          image_path: parser.main_image,
          status: 'new',
          load_id: load.id,
          images: parser.images,
          description: parser.description,
          publicated_at: parser.publicated_at,
          location: parser.location
        )
      end

      def agent
        @agent ||= Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome' }
      end
    end
  end
end
