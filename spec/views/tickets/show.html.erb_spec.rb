require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
