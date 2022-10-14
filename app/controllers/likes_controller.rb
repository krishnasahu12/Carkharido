class LikesController < ApplicationController
before_action :authenticate_user!

	def create
		if params[:car_id]
			@car = Car.find(params[:car_id])
     		if already_liked?
			 flash[:notice] = "You can't like more than once"
		    else
			 @car.likes.create(user_id: current_user.id)
		    end
			redirect_to car_path(@car)

        else params[:review_id]
			@review = Review.find_by(id: params[:review_id])
			@car = @review.car
            if already_liked?
				flash[:notice] = "You can't like more than once"
			else
				@review.likes.create(user_id: current_user.id)
			end
			   redirect_to car_path(@car)
	    end
	end

private

  def already_liked?
	if params[:car_id]
		Like.find_by(user_id: current_user.id, likeable_type: "Car", likeable_id: params[:car_id]).present?
	elsif params[:review_id]
		Like.find_by(user_id: current_user.id, likeable_type: "Review", likeable_id: params[:review_id]).present?
	end
	end
end