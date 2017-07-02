require 'rails_helper'

RSpec.describe StatsController, type: :controller do

  describe "GET #general" do
    it "returns http success" do
      get :general
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #week" do
    it "returns http success" do
      get :week
      expect(response).to have_http_status(:success)
    end
  end

end
