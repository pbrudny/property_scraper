module RmnImport
  module Sendinblue
    class Client
      def deliver(data)
        Sendinblue::Response.new(mailin.send_transactional_template(data))
      end

      def get_report(data)
        response = Sendinblue::Response.new(mailin.get_report(data))
        Sendinblue::EmailEventReport.new(response)
      end

      private

      def sendinblue_logger(message)
        Rails.logger.tagged(self.class) { Rails.logger.info message }
      end

      def mailin
        ::Sendinblue::Mailin.new(api_url, sendinblue_api_key, 5)
      end

      def api_url
        'https://api.sendinblue.com/v2.0'
      end

      def sendinblue_api_key
        Rails.application.secrets.sendinblue_api_key || raise('Missing SendInBlue API Key!')
      end
    end
  end
end

