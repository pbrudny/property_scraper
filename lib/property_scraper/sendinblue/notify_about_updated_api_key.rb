module RmnImport
  module Sendinblue
    class NotifyAboutUpdatedApiKey < Sendinblue::Client
      def initialize(user_id:, api_key:, email:, template_locale: :en)
        self.user_id = user_id
        self.api_key = api_key
        self.email = email
        self.template_locale = template_locale
      end

      def call
        sendinblue_logger(log_message)
        create_user_message(deliver(sendinblue_data))
      end

      private

      attr_accessor :user_id, :template_locale, :api_key, :email

      def create_user_message(response)
        UserMessage.create!(
          user_id: user_id,
          message_key: response.message_id,
          response_status: response.code,
          response_message: response.message,
          message_type: 'updated_api_key',
          template_id: template_id,
          template_attributes: template_attributes
        )
      end

      def log_message
        "Sending email to User ID: #{user_id} with locale: #{template_locale}"
      end

      def sendinblue_data
        {
          'id' => template_id,
          'from' => sender,
          'to' => recipients,
          'attr' => template_attributes
        }
      end

      def template_id
        case template_locale
          when :fr then Gaston.sendinblue.templates.fr.updated_api_key
          when :en then Gaston.sendinblue.templates.en.updated_api_key
        end
      end

      def sender
        Gaston.emails.from
      end

      def recipients
        (Gaston.emails.to + [email]).join('|')
      end

      def template_attributes
        {
          'API_KEY' => api_key,
          'DOC_URL' => RmnUrls.docs
        }
      end
    end
  end
end
