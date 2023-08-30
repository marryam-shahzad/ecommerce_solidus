class RemoveDeliverySlotReferenceFromSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :spree_orders, :delivery_slot, foreign_key: true
  end
end
