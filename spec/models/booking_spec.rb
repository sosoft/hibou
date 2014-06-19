require 'spec_helper'

describe Booking do
  describe "validation rules" do
    it "is considered invalid without a period" do
      Booking.make(:period => '').should_not be_valid
    end

    it "is considered invalid without a date" do
      Booking.make(:date => '').should_not be_valid
    end

    it "is considered invalid without a child" do
      Booking.make(:child => nil).should_not be_valid
    end

    it "is considered invalid with an unknown period" do
      Booking.make(:period => 'unknown').should_not be_valid
    end

    it "is considered invalid without a payment method" do
      Booking.make(:payment_method => '').should_not be_valid
    end

    it "is considered invalid if a booking of the same child already exists for the time slot" do
      child = Child.make!
      am_period = 'AM'

      Booking.make!(:child => child, :period => am_period)
      Booking.make(:child => child, :period => am_period).should_not be_valid
    end
  end

  describe "when there are existing bookings" do
    before(:each) do
      Booking.make!(:date => "2010-11-27", :period => 'AM')
      Booking.make!(:date => "2010-11-27", :period => 'AM')
      Booking.make!(:date => "2010-11-28", :period => 'AM')
      Booking.make!(:date => "2010-11-28", :period => 'PM')
    end

    it "finds morning bookings for a given date" do
      bookings = Booking.find_bookings_on("2010-11-27", :am)
      bookings.should have(2).elements
      bookings.should each(be_on("2010-11-27").before_noon)
    end

    it "finds afternoon bookings for a given date" do
      bookings = Booking.find_bookings_on("2010-11-28", :pm)
      bookings.should have(1).element
      bookings.should each(be_on("2010-11-28").after_noon)
    end
  end
end
