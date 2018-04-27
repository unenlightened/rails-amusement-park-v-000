class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.valid?
      redirect_to @attraction
    else
      render :new
    end
  end

#can put this in a ride controller as ride create ....
  def ride
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    ride_message = ride.take_ride
    redirect_to ride.user, alert: ride_message
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
