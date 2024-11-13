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
    @restaurant = Restaurant.find(params[:id].to_i)
    @test_variable = "Hello, World!"
    puts "Inside the show action"  # Ajoutez ce message
    raise "This is a test error"   # Ajoutez une exception pour voir si elle est levée
  end
end
