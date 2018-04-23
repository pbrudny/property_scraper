require 'rails_helper'

RSpec.describe "user_messages/show", type: :view do
  before(:each) do
    @user_message = assign(:user_message, UserMessage.create!(
      :result => "Result"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Result/)
  end
end
