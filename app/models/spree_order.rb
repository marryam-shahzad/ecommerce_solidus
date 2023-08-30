class SpreeOrder < ApplicationRecord
  # belongs_to :delivery_time_slot
  # Other associations and code
  has_one :delivery_time_slot
  accepts_nested_attributes_for :delivery_time_slot  # If you're using nested attributes

  attr_accessible :delivery_time_slot_id, ... 
end
