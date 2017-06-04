require 'rails_helper'

RSpec.describe "alerts/new", type: :view do
  before(:each) do
    assign(:alert, Alert.new(
      :search_link => nil,
      :email => "MyString",
      :frequency => "MyString"
    ))
  end

  it "renders new alert form" do
    render

    assert_select "form[action=?][method=?]", alerts_path, "post" do

      assert_select "input#alert_search_link_id[name=?]", "alert[search_link_id]"

      assert_select "input#alert_email[name=?]", "alert[email]"

      assert_select "input#alert_frequency[name=?]", "alert[frequency]"
    end
  end
end
