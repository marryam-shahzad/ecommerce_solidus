# app/models/spree/order.rb
class Order < ApplicationRecord
  # ...
  has_one :delivery_time_slot_id
  accepts_nested_attributes_for :delivery_time_slot_id  # If you're using nested attributes

  attr_accessible :delivery_time_slot_id, ...  # Add :delivery_time_slot_id to the list
end
