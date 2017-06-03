require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :ad => nil,
      :body => "MyString"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input#note_ad_id[name=?]", "note[ad_id]"

      assert_select "input#note_body[name=?]", "note[body]"
    end
  end
end
