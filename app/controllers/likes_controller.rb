class LikesController < ApplicationController
before_action :authenticate_user!

	def create
		if params[:car_id]
			@car = Car.find(params[:car_id])
			@like = @car.likes.create
			if @like.save
				redirect_to car_path(@car)
			end
		else
		    @review = Review.find(params[:review_id])
			@car = @review[:car_id]
			@review.likes.create
			if @review.save
				redirect_to car_path(@car)
			end
		end
		end
	end