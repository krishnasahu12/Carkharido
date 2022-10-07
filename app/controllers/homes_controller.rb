class HomesController < ApplicationController
  def index
     @cars = Car.all
  end
end
