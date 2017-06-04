require 'rails_helper'

RSpec.describe "loads/show", type: :view do
  before(:each) do
    @load = assign(:load, Load.create!(
      :errors => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
