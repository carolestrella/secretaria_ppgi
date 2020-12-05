require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(),
      Booking.create!()
    ])
  end

  it "renders a list of bookings" do
    render
  end
end
