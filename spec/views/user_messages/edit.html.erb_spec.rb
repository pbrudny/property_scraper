require 'rails_helper'

RSpec.describe "user_messages/edit", type: :view do
  before(:each) do
    @user_message = assign(:user_message, UserMessage.create!(
      :result => "MyString"
    ))
  end

  it "renders the edit user_message form" do
    render

    assert_select "form[action=?][method=?]", user_message_path(@user_message), "post" do

      assert_select "input#user_message_result[name=?]", "user_message[result]"
    end
  end
end
