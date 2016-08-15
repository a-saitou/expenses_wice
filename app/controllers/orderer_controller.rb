class OrdererController < ApplicationController
  def index
  	@orderers_grid = initialize_grid(Orderer)
  end


end
