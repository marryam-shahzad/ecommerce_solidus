module ApplicationHelper
	def today_is_friday?
    Date.today.friday?
  end

  def allowed_friday_slots
    [5, 6, 7] # Delivery time slot IDs allowed on Friday
  end
end
