class ApplicationRecord < ActiveRecord::Base
  # primary_abstract_class
    self.abstract_class = true

  # Add associations for delivery time slots
  has_and_belongs_to_many :delivery_time_slots

  # Add validation and other methods for delivery time slots
  validate :validate_delivery_time_slot_availability

  private

  def validate_delivery_time_slot_availability
    # Your validation logic here
  end
end
