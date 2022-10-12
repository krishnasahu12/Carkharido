class EnquiriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @enquiry = Enquiry.all
  end

  def show
    @enquiry = Enquiry.find(params[:id])
  end

  def new
    @enquiry = Enquiry.new
  end

  def create
    if Enquiry.create(enquiry_params)
      redirect_to cars_path
    else
      render :new
    end
  end

  private
  def enquiry_params
    params.require(:enquiry).permit(:content,:contact_no,:car_id)
  end
end
