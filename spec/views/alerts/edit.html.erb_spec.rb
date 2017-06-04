require 'rails_helper'

RSpec.describe "alerts/edit", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      :search_link => nil,
      :email => "MyString",
      :frequency => "MyString"
    ))
  end

  it "renders the edit alert form" do
    render

    assert_select "form[action=?][method=?]", alert_path(@alert), "post" do

      assert_select "input#alert_search_link_id[name=?]", "alert[search_link_id]"

      assert_select "input#alert_email[name=?]", "alert[email]"

      assert_select "input#alert_frequency[name=?]", "alert[frequency]"
    end
  end
end
