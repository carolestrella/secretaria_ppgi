require 'rails_helper'

RSpec.describe "request_deadlines/show", type: :view do
  before(:each) do
    @request_deadline = assign(:request_deadline, RequestDeadline.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
