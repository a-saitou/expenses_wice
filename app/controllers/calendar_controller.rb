class CalendarController < ApplicationController
  def index
  	@calendars_grid = initialize_grid(Calendr)
  end

 
end
