require 'rails_helper'

RSpec.describe "SearchLinks", type: :request do
  describe "GET /search_links" do
    it "works! (now write some real specs)" do
      get search_links_path
      expect(response).to have_http_status(200)
    end
  end
end
