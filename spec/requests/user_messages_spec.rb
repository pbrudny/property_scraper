require 'rails_helper'

RSpec.describe "UserMessages", type: :request do
  describe "GET /user_messages" do
    it "works! (now write some real specs)" do
      get user_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
