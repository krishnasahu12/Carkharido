class BuysController < ApplicationController

  def index
    @buys = Buy.new
  end

  def new
    @buy = Buy.new
  end
end
