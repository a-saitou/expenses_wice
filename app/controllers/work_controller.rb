class WorkController < ApplicationController
  def index
  	@works_grid = initialize_grid(Work,
  		include: [:calendar,:staff,:agreement])
  end

 
end
