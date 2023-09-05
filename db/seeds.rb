# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
Spree::Core::Engine.load_seed
Spree::Auth::Engine.load_seed


# # db/seeds.rb

# # db/seeds.rb

# # Clear existing data from the DeliveryTimeSlot table
# # DeliveryTimeSlot.destroy_all

# # Define the time range and slot duration
# start_time = Time.parse("11:00 AM").utc + 5.hours # Convert to PKT
# end_time = Time.parse("11:00 PM").utc + 5.hours   # Convert to PKT
# slot_duration = 1.hour
# available_slots_per_interval = 5

# # Generate new delivery time slots
# current_time = start_time
# while current_time < end_time
#   DeliveryTimeSlot.create!(
#     start_time: current_time,
#     end_time: current_time + slot_duration,
#     available_slots: available_slots_per_interval
#   )
  
#   current_time += slot_duration
# end

# puts "Generated #{DeliveryTimeSlot.count} delivery time slots."




# Set the time zone to Pakistan (PKT)
# Time.zone = 'Islamabad'

# Define time slot parameters
DeliveryTimeSlot.delete_all
start_time = Time.zone.parse("11:00 AM")
end_time = Time.zone.parse("11:00 PM")
slot_duration = 1.hour
available_slots_per_interval = 5

# Generate new delivery time slots
current_time = start_time
while current_time < end_time
  DeliveryTimeSlot.create!(
    start_time: current_time,
    end_time: current_time + slot_duration,
    available_slots: available_slots_per_interval
  )
  
  current_time += slot_duration
end



# start_time = Time.zone.parse("11:00 AM")
# end_time = Time.zone.parse("11:00 PM")
# slot_duration = 1.hour
# available_slots_per_interval = 5

# # Generate new delivery time slots
# current_time = start_time
# while current_time < end_time
#   # Create a new time slot without specifying any date
#   DeliveryTimeSlot.create!(
#     start_time: Time.zone.local(2000, 1, 1, current_time.hour, current_time.min),
#     end_time: Time.zone.local(2000, 1, 1, (current_time + slot_duration).hour, (current_time + slot_duration).min),
#     available_slots: available_slots_per_interval
#   )
  
#   current_time += slot_duration
# end

