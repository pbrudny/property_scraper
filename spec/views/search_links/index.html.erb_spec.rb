require 'rails_helper'

RSpec.describe "search_links/index", type: :view do
  before(:each) do
    assign(:search_links, [
      SearchLink.create!(
        :name => "Name",
        :url => "Url",
        :site => nil
      ),
      SearchLink.create!(
        :name => "Name",
        :url => "Url",
        :site => nil
      )
    ])
  end

  it "renders a list of search_links" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
