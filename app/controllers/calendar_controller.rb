class CalendarController < ApplicationController
  def index
  	@calendars_grid = initialize_grid(Calendar)
  end

 
end
