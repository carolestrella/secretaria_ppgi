require 'rails_helper'

RSpec.describe "request_types/new", type: :view do
  before(:each) do
    assign(:request_type, RequestType.new(
      title: "MyString"
    ))
  end

  it "renders new request_type form" do
    render

    assert_select "form[action=?][method=?]", request_types_path, "post" do

      assert_select "input[name=?]", "request_type[title]"
    end
  end
end
