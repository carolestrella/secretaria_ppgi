require 'rails_helper'

RSpec.describe "requirements/index", type: :view do
  before(:each) do
    assign(:requirements, [
      Requirement.create!(
        requirements: "Requirements"
      ),
      Requirement.create!(
        requirements: "Requirements"
      )
    ])
  end

  it "renders a list of requirements" do
    render
    assert_select "tr>td", text: "Requirements".to_s, count: 2
  end
end
