require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :address => "MyText",
        :note => "MyText",
        :ad => nil,
        :user => nil
      ),
      Appointment.create!(
        :address => "MyText",
        :note => "MyText",
        :ad => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
