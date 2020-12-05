require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(),
      Ticket.create!()
    ])
  end

  it "renders a list of tickets" do
    render
  end
end
