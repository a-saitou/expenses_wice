class StaffController < ApplicationController
  def index
  	@staffs_grid = initialize_grid(Staff)
  end

end
