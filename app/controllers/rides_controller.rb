class RidesController < ApplicationController

   def new
      @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      user = @ride.user
      attraction = @ride.attraction

      if user.is_tall_enough?(attraction) && user.has_enough_tickets?(attraction)
         new_tickets = user.tickets - attraction.tickets
         new_happiness = user.happiness + attraction.happiness_rating      
         new_nausea = user.nausea + attraction.nausea_rating
         user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
         @message = "Thanks for riding the #{attraction.name}!"
      else
         @message = @ride.take_ride         
      end
      redirect_to user_path(user, message: @message)
   end
end