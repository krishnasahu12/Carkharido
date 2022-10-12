class ReviewsController < ApplicationController
	before_action :authenticate_user!

def create
	if Review.create(review_params)
		redirect_to cars_path
	end
end

def destroy
	if @review.destroy
		@car = Car.find(params[:car_id])
		redirect_to @car
	end
end

private
def review_params
	params.require(:review).permit(:description,:car_id)
end
end
