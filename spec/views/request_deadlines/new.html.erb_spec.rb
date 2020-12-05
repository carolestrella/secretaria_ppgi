require 'rails_helper'

RSpec.describe "request_deadlines/new", type: :view do
  before(:each) do
    assign(:request_deadline, RequestDeadline.new())
  end

  it "renders new request_deadline form" do
    render

    assert_select "form[action=?][method=?]", request_deadlines_path, "post" do
    end
  end
end
