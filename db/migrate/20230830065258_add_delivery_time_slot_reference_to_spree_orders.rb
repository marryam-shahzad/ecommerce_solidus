class AddDeliveryTimeSlotReferenceToSpreeOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :spree_orders, :delivery_time_slot
  end
end
