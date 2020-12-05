require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        request_type_id: nil,
        user_id: nil,
        documents: "Documents"
      ),
      Request.create!(
        request_type_id: nil,
        user_id: nil,
        documents: "Documents"
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Documents".to_s, count: 2
  end
end
