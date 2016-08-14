class WorkController < ApplicationController
  def index
  end

  def work_data
    works = Work.all
    
    render :json => {
      :total_count => works.length,
      :pos => 0,
      :rows => works.map do |work|
        {
          :id => work.id,
          :data => [work.date, work.stff_id,work.agreement_id,work.start_time, work.end_time,work.work_time, 
            work.over_time, work.late_night_over_time, work.paid_holiday,work.note]
        }
      end
    }
  end

  def work_db_action
    @mode = params["!nativeeditor_status"]
    date = params["c0"]
    stff_id = params['c1']
    agreement_id = params['c2']    
    start_time = params['c3']
    end_time = params['c4']
    work_time = params['c5']
    late_night_over_time = params['c6']
    over_time = params['c7']
    paid_holiday = params['c8']
    note = params['c9']    

    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      work = work.create :date => date, :staff_id => staff_id, :agreement_id => agreement_id, :start_time => start_time, 
      :end_time => end_time,:work_time => work_time, :over_time => over_time, 
      :late_night_over_time => late_night_over_time, :paid_holiday => paid_holiday, :note => note
      @tid = work.id
      
    when "deleted"
      work.find(@id).destroy
      @tid = @id 
      
    when "updated"
      work = Work.find(@id)
      work.date = date
      work.staff_id = staff_id
      work.agreement_id = agreement_id
      work.start_time = start_time
      work.end_time = end_time
      work.work_time = work_time
      work.over_time = over_time
      work.late_night_over_time = late_night_over_time   
      work.paid_holiday = paid_holiday
      work.note = note    
	work.save
      @tid = @id
    end
  end
end
