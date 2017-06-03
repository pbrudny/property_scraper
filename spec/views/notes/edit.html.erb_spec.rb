require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :ad => nil,
      :body => "MyString"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_ad_id[name=?]", "note[ad_id]"

      assert_select "input#note_body[name=?]", "note[body]"
    end
  end
end
