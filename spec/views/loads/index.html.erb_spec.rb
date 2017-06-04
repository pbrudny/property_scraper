require 'rails_helper'

RSpec.describe "loads/index", type: :view do
  before(:each) do
    assign(:loads, [
      Load.create!(
        :errors => ""
      ),
      Load.create!(
        :errors => ""
      )
    ])
  end

  it "renders a list of loads" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
