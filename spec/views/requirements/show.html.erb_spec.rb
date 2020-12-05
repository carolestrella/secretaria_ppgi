require 'rails_helper'

RSpec.describe "requirements/show", type: :view do
  before(:each) do
    @requirement = assign(:requirement, Requirement.create!(
      requirements: "Requirements"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Requirements/)
  end
end
