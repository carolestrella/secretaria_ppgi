require 'rails_helper'

RSpec.describe "requirements/new", type: :view do
  before(:each) do
    assign(:requirement, Requirement.new(
      requirements: "MyString"
    ))
  end

  it "renders new requirement form" do
    render

    assert_select "form[action=?][method=?]", requirements_path, "post" do

      assert_select "input[name=?]", "requirement[requirements]"
    end
  end
end
