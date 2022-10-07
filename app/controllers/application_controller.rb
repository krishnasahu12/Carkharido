class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :mobile, :password, :password_confirmation, :remember_me]
  end
end