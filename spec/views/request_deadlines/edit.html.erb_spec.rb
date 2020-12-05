require 'rails_helper'

RSpec.describe "request_deadlines/edit", type: :view do
  before(:each) do
    @request_deadline = assign(:request_deadline, RequestDeadline.create!())
  end

  it "renders the edit request_deadline form" do
    render

    assert_select "form[action=?][method=?]", request_deadline_path(@request_deadline), "post" do
    end
  end
end
