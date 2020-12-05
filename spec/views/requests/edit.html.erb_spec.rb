require 'rails_helper'

RSpec.describe "requests/edit", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      request_type_id: nil,
      user_id: nil,
      documents: "MyString"
    ))
  end

  it "renders the edit request form" do
    render

    assert_select "form[action=?][method=?]", request_path(@request), "post" do

      assert_select "input[name=?]", "request[request_type_id_id]"

      assert_select "input[name=?]", "request[user_id_id]"

      assert_select "input[name=?]", "request[documents]"
    end
  end
end
