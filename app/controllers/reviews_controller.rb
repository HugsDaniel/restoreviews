class ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant

    @review.destroy

    redirect_to restaurant_path(@restaurant)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end
end
