class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to cars_index_path
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:description, :car_id)
  end
end
