module Scrapers
  module Olx
    class Parser
      def initialize(link, agent)
        self.link = link
        self.agent = agent
      end

      def main_image
        image = html_doc.xpath("//div[@class='photo-handler rel inlblk']/img")
        image.first['src'] if image.present?
      end

      def images
        html_doc.xpath("//div[@class='photo-glow']/img").map { |l| l['src'] }
      end

      def offer_id
        html_doc.
          xpath('//div[contains(@class, "offer-titlebox__details")]/em/small/text()')
          .to_s.split(':')
          .last.strip
      end

      def publicated_at
        raw_date = html_doc.xpath('//div[contains(@class, "offer-titlebox__details")]/em/text()')
        date = raw_date.to_s.strip.gsub(',','').split
        DateTime.parse "#{date[5]} #{eng_month[date[4]]} #{date[3]} #{date[2]}"
      end

      def eng_month
        {
          'Janeiro'=> 'January',
          'Fevereiro' => 'February',
          'Março' => 'March',
          'Abril' => 'April',
          'Maio' => 'May',
          'Junho' => 'June',
          'Julho' => 'July',
          'Agosto' => 'August',
          'Setembro' => 'September',
          'Outubro' => 'October',
          'Novembro' => 'November',
          'Dezembro' => 'December'
        }
      end

      def location
        html_doc.xpath('//div[contains(@class, "offer-titlebox__details")]/a/strong/text()').to_s
      end

      def title
        html_doc
          .xpath('//div[contains(@class, "offer-titlebox")]/h1/text()')
          .to_s
          .strip
      end

      def price
        html_doc.xpath('//*[@id="offeractions"]/div[1]/strong/text()').to_s.gsub(/\./, '').to_i
      end

      def description
        html_doc.xpath('//*[@id="textContent"]/p').to_s.strip
      end

      def phone_number
        phone_url = 'https://www.olx.pt/ajax/misc/contact/phone/'
        str  = html_doc.xpath('//*[@id="contact-form"]/@action').to_s
        id   = str[/-ID.+?.html/].to_s.gsub("-ID", "").gsub(".html", "")
        link = phone_url + id + "/"
        begin
          page = agent.get(link)
          return page.body.to_s[/([0-9]+\s?){3}/]
        rescue Exception => e
          page = e.page
          return nil
        end
      end

      private

      attr_accessor :link, :agent

      def html_doc
        @html_doc ||= Nokogiri::HTML(agent.get(link.to_s).body, 'UTF-8')
      end
    end
  end
end

