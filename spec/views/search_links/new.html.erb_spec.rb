require 'rails_helper'

RSpec.describe "search_links/new", type: :view do
  before(:each) do
    assign(:search_link, SearchLink.new(
      :name => "MyString",
      :url => "MyString",
      :site => nil
    ))
  end

  it "renders new search_link form" do
    render

    assert_select "form[action=?][method=?]", search_links_path, "post" do

      assert_select "input#search_link_name[name=?]", "search_link[name]"

      assert_select "input#search_link_url[name=?]", "search_link[url]"

      assert_select "input#search_link_site_id[name=?]", "search_link[site_id]"
    end
  end
end
