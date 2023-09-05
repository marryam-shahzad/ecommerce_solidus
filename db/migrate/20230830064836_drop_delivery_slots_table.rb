rclass DropDeliverySlotsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :delivery_slots
  end

  def down
    create_table :delivery_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :available_slots

      t.timestamps
    end
  end
end
