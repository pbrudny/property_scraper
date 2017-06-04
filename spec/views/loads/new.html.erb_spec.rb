require 'rails_helper'

RSpec.describe "loads/new", type: :view do
  before(:each) do
    assign(:load, Load.new(
      :errors => ""
    ))
  end

  it "renders new load form" do
    render

    assert_select "form[action=?][method=?]", loads_path, "post" do

      assert_select "input#load_errors[name=?]", "load[errors]"
    end
  end
end
