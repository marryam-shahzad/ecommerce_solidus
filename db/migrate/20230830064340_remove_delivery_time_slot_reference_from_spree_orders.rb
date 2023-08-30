class RemoveDeliveryTimeSlotReferenceFromSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :spree_orders, :delivery_time_slot_id, :bigint
  end
end
