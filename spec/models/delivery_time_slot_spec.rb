# spec/models/delivery_time_slot_spec.rb

require 'rails_helper'

RSpec.describe DeliveryTimeSlot, type: :model do
  it 'is valid with valid attributes' do
    time_slot = build(:delivery_time_slot, start_time: Time.now, end_time: 2.hours.from_now)
    expect(time_slot).to be_valid
  end

  it 'is invalid if start time is after end time' do
    time_slot = build(:delivery_time_slot, start_time: Time.now, end_time: 1.hour.ago)
    expect(time_slot).not_to be_valid
  end

  it 'is invalid without a start time' do
    time_slot = build(:delivery_time_slot, start_time: nil, end_time: 2.hours.from_now)
    expect(time_slot).not_to be_valid
  end

  it 'is invalid without an end time' do
    time_slot = build(:delivery_time_slot, start_time: Time.now, end_time: nil)
    expect(time_slot).not_to be_valid
  end

  # Add more test cases for other model validations, associations, or methods as needed
end
