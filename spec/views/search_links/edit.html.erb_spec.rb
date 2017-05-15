require 'rails_helper'

RSpec.describe "search_links/edit", type: :view do
  before(:each) do
    @search_link = assign(:search_link, SearchLink.create!(
      :name => "MyString",
      :url => "MyString",
      :site => nil
    ))
  end

  it "renders the edit search_link form" do
    render

    assert_select "form[action=?][method=?]", search_link_path(@search_link), "post" do

      assert_select "input#search_link_name[name=?]", "search_link[name]"

      assert_select "input#search_link_url[name=?]", "search_link[url]"

      assert_select "input#search_link_site_id[name=?]", "search_link[site_id]"
    end
  end
end
