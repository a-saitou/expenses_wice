class CalendarController < ApplicationController
  def index
  end

  def data
    calendars = Calendar.all
    
    render :json => {
      :total_count => calendars.length,
      :pos => 0,
      :rows => calendars.map do |calendar|
        {
          :id => calendar.id,
          :data => [calendar.hiduke, calendar.year, calendar.month, calendar.day, calendar.holiday]
        }
      end
    }
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    hiduke = params["c0"]
    year = params['c1']
    month = params['c2']
    day = params['c3']
    holiday = params['c4']    
    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      calendar = calendar.create :hiduke => hiduke, :year => year, :month => month, :day => day, :holiday => holiday
      @tid = calendar.id
      
    when "deleted"
      calendar.find(@id).destroy
      @tid = @id 
      
    when "updated"
      calendar = Calendar.find(@id)
      calendar.hiduke = hiduke
      calendar.year = year
      calendar.month = month
      calendar.day = day
      calendar.holiday = holiday
	calendar.save
      @tid = @id
    end
  end
end
