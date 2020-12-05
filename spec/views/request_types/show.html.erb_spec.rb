require 'rails_helper'

RSpec.describe "request_types/show", type: :view do
  before(:each) do
    @request_type = assign(:request_type, RequestType.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
