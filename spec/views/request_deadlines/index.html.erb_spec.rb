require 'rails_helper'

RSpec.describe "request_deadlines/index", type: :view do
  before(:each) do
    assign(:request_deadlines, [
      RequestDeadline.create!(),
      RequestDeadline.create!()
    ])
  end

  it "renders a list of request_deadlines" do
    render
  end
end
