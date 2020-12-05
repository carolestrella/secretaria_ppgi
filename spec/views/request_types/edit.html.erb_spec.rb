require 'rails_helper'

RSpec.describe "request_types/edit", type: :view do
  before(:each) do
    @request_type = assign(:request_type, RequestType.create!(
      title: "MyString"
    ))
  end

  it "renders the edit request_type form" do
    render

    assert_select "form[action=?][method=?]", request_type_path(@request_type), "post" do

      assert_select "input[name=?]", "request_type[title]"
    end
  end
end
