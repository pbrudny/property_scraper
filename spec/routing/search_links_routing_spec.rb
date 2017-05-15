require "rails_helper"

RSpec.describe SearchLinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/search_links").to route_to("search_links#index")
    end

    it "routes to #new" do
      expect(:get => "/search_links/new").to route_to("search_links#new")
    end

    it "routes to #show" do
      expect(:get => "/search_links/1").to route_to("search_links#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/search_links/1/edit").to route_to("search_links#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/search_links").to route_to("search_links#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/search_links/1").to route_to("search_links#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/search_links/1").to route_to("search_links#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/search_links/1").to route_to("search_links#destroy", :id => "1")
    end

  end
end
