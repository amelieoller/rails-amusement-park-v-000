class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if !user.is_tall_enough?(attraction) && !user.has_enough_tickets?(attraction)
      "Sorry. #{ticket_issue} #{height_issue}"
    elsif !user.has_enough_tickets?(attraction)
      "Sorry. #{ticket_issue}"
    elsif !user.is_tall_enough?(attraction)
      "Sorry. #{height_issue}"
    else
      updated_tickets = user.tickets - attraction.tickets
      updated_nausea = user.nausea + attraction.nausea_rating
      updated_happiness = user.happiness + attraction.happiness_rating
      user.update(tickets: updated_tickets, nausea: updated_nausea, happiness: updated_happiness)
    end
  end

  def ticket_issue
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{self.attraction.name}."
  end

end
