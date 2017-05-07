module RmnImport
  module Sendinblue
    class Response
      def initialize(params)
        self.params = params
      end

      def code
        params['code']
      end

      def message
        params['message']
      end

      def data
        params['data']
      end

      def message_id
        data['message-id'] if data.present?
      end

      private

      attr_accessor :params
    end
  end
end
