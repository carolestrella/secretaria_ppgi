require 'rails_helper'

RSpec.describe "budgets/index", type: :view do
  before(:each) do
    assign(:budgets, [
      Budget.create!(
        value: "9.99"
      ),
      Budget.create!(
        value: "9.99"
      )
    ])
  end

  it "renders a list of budgets" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
