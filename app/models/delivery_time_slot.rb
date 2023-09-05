class DeliveryTimeSlot < ApplicationRecord
  # has_many :spree_orders, class_name: 'Order', foreign_key: 'delivery_time_slot_id'
  has_many :orders, dependent: :destroy
   validates :start_time, :end_time, presence: true
  validate :start_time_must_be_before_end_time
  # Other model logic, associations, and methods go here

  private

  # def start_time_must_be_before_end_time
  #   errors.add(:start_time, 'must be before end time') if start_time >= end_time
  # end
end


# class DeliveryTimeSlot < ApplicationRecord
#   has_many :orders
  
#   scope :available_slots, ->(date) do
#     where('start_time >= ? AND end_time <= ?', date.beginning_of_day, date.end_of_day)
#       .select { |time_slot| time_slot.orders.count < 5 } # Adjust this condition based on your limit
#   end
# end
