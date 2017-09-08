class WeaponsController < ApplicationController
  def index
    @categories = Category.all
  end
end
