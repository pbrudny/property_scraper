require 'rails_helper'

RSpec.describe "search_links/show", type: :view do
  before(:each) do
    @search_link = assign(:search_link, SearchLink.create!(
      :name => "Name",
      :url => "Url",
      :site => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
