class DeliveryTimeSlot < ApplicationRecord
  has_many :spree_orders, class_name: 'Spree::Order', foreign_key: 'delivery_slot_id'
end


# class DeliveryTimeSlot < ApplicationRecord
#   has_many :orders
  
#   scope :available_slots, ->(date) do
#     where('start_time >= ? AND end_time <= ?', date.beginning_of_day, date.end_of_day)
#       .select { |time_slot| time_slot.orders.count < 5 } # Adjust this condition based on your limit
#   end
# end
