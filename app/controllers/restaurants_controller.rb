class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id].to_i)
    if @restaurant.nil?
      redirect_to restaurants_path, alert: "Restaurant not found"
    else
      @reviews = @restaurant.reviews
    end
  end
end
