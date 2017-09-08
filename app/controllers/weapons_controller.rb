class WeaponsController < ApplicationController
  def index
    @root_categories = Category.select {|category| category.root? }
  end
end
