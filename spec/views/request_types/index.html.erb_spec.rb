require 'rails_helper'

RSpec.describe "request_types/index", type: :view do
  before(:each) do
    assign(:request_types, [
      RequestType.create!(
        title: "Title"
      ),
      RequestType.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of request_types" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
