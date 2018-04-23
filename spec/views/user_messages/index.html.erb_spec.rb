require 'rails_helper'

RSpec.describe "user_messages/index", type: :view do
  before(:each) do
    assign(:user_messages, [
      UserMessage.create!(
        :result => "Result"
      ),
      UserMessage.create!(
        :result => "Result"
      )
    ])
  end

  it "renders a list of user_messages" do
    render
    assert_select "tr>td", :text => "Result".to_s, :count => 2
  end
end
