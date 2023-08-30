class DropDeliveryTimeSlots < ActiveRecord::Migration[6.0]
  def up
    drop_table :delivery_time_slots
  end

  def down
    create_table :delivery_time_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :available_slots

      t.timestamps
    end
  end
end
