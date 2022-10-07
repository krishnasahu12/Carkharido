class LikesController < ApplicationController
before_action :authenticate_user!

	def create
		if params[:car_id]
			@car = Car.find(params[:car_id])
			@like = @car.likes.create
			if @like.save
				redirect_to cars_path
			end
		end
	end
end