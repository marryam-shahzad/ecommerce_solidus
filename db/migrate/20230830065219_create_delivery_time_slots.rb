class CreateDeliveryTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_time_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :available_slots

      t.timestamps
    end
  end
end
