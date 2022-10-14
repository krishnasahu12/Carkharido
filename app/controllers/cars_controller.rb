class CarsController < ApplicationController
before_action :authenticate_user!, except: %i[index]

  def index
  	if params[:brand]
		@cars = Car.where(brand: params[:brand]).where.not(user_id: current_user.id)
	elsif current_user
		@cars = Car.where.not(user_id: current_user.id)
	else
		@cars = Car.all
  end
end

  def new
   @car = Car.new
  end

  def create
	@car = current_user.cars.create(car_params)
	if @car.save
	  redirect_to root_path
	else
	  render :new
	end
end

   def show
	    @car = Car.find(params[:id])
   end

   def edit
	  	@car = Car.find(params[:id])
   end

   def update
	@car = Car.find(params[:id])
	if @car.update(car_params)
	    redirect_to @car
	else
	      render :new
	end
  end

  def destroy
	 @car = Car.find(params[:id])
	 @car.destroy

	redirect_to root_path
  end

  def new_buy
  end

private
	def car_params
	  params.require(:car).permit(:brand, :model, :price, :maufacture_year, :variant, images:[])
	end
end
