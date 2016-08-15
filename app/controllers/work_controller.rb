class WorkController < ApplicationController
  def index
  	@works_grid = initialize_grid(Work)
  end

 
end
