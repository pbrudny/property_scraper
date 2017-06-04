require 'rails_helper'

RSpec.describe "alerts/show", type: :view do
  before(:each) do
    @alert = assign(:alert, Alert.create!(
      :search_link => nil,
      :email => "Email",
      :frequency => "Frequency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Frequency/)
  end
end
