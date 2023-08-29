class AddSelectedDeliveryDayToSpreeOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_orders, :selected_delivery_day, :string
  end
end
