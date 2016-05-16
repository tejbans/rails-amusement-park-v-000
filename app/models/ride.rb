class Ride < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :attraction

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      start_ride

    end
  end

  def start_ride
    new_tickets = user.tickets - attraction.tickets
    new_nausea = user.nausea + attraction.nausea_rating
    new_happiness = user.happiness + attraction.happiness_rating
    user.update(:tickets => new_tickets, :nausea => new_nausea, :happiness => new_happiness)
     "Thanks for riding the #{self.attraction.name}!"
  end

end
