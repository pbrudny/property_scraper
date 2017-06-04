require 'rails_helper'

RSpec.describe "alerts/index", type: :view do
  before(:each) do
    assign(:alerts, [
      Alert.create!(
        :search_link => nil,
        :email => "Email",
        :frequency => "Frequency"
      ),
      Alert.create!(
        :search_link => nil,
        :email => "Email",
        :frequency => "Frequency"
      )
    ])
  end

  it "renders a list of alerts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
  end
end
