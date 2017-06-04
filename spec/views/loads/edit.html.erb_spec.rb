require 'rails_helper'

RSpec.describe "loads/edit", type: :view do
  before(:each) do
    @load = assign(:load, Load.create!(
      :errors => ""
    ))
  end

  it "renders the edit load form" do
    render

    assert_select "form[action=?][method=?]", load_path(@load), "post" do

      assert_select "input#load_errors[name=?]", "load[errors]"
    end
  end
end
