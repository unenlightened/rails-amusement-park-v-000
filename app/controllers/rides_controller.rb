class WelcomeController < ApplicationController
  def ride
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    ride_message = ride.take_ride
    redirect_to ride.user, alert: ride_message
  end
end
