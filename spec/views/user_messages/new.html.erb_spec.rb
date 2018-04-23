require 'rails_helper'

RSpec.describe "user_messages/new", type: :view do
  before(:each) do
    assign(:user_message, UserMessage.new(
      :result => "MyString"
    ))
  end

  it "renders new user_message form" do
    render

    assert_select "form[action=?][method=?]", user_messages_path, "post" do

      assert_select "input#user_message_result[name=?]", "user_message[result]"
    end
  end
end
