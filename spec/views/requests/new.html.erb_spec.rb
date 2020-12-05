require 'rails_helper'

RSpec.describe "requests/new", type: :view do
  before(:each) do
    assign(:request, Request.new(
      request_type_id: nil,
      user_id: nil,
      documents: "MyString"
    ))
  end

  it "renders new request form" do
    render

    assert_select "form[action=?][method=?]", requests_path, "post" do

      assert_select "input[name=?]", "request[request_type_id_id]"

      assert_select "input[name=?]", "request[user_id_id]"

      assert_select "input[name=?]", "request[documents]"
    end
  end
end
