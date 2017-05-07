module RmnImport
  module Sendinblue
    class GetEmailEventReport < Sendinblue::Client
      def initialize(message_key)
        self.message_key = message_key
      end

      def call
        sendinblue_logger(log_message)
        get_report(sendinblue_data)
      end

      private

      attr_accessor :message_key

      def log_message
        'Getting report'
      end

      def sendinblue_data
        { 'message_id' => message_key }
      end
    end
  end
end
