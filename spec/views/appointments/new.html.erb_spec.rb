require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :address => "MyText",
      :note => "MyText",
      :ad => nil,
      :user => nil
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "textarea#appointment_address[name=?]", "appointment[address]"

      assert_select "textarea#appointment_note[name=?]", "appointment[note]"

      assert_select "input#appointment_ad_id[name=?]", "appointment[ad_id]"

      assert_select "input#appointment_user_id[name=?]", "appointment[user_id]"
    end
  end
end
