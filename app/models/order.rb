# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :delivery_time_slot, class_name: 'DeliveryTimeSlot'
  # ... other associations and code
end
