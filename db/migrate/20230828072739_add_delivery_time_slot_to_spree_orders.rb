class AddDeliveryTimeSlotToSpreeOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :spree_orders, :delivery_time_slot, foreign_key: true, default: 1
  end
end
