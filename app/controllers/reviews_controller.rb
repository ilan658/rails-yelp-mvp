# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review added successfully!"
    else
      # Si la validation échoue, on affiche les erreurs dans la vue show
      render "restaurants/show"
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
