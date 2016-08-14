class StaffController < ApplicationController
  def index
  end

  def data
    staffs = Staff.all
    
    render :json => {
      :total_count => staffs.length,
      :pos => 0,
      :rows => staffs.map do |staff|
        {
          :id => staff.id,
          :data => [staff.name, staff.office, staff.order, staff.wage, staff.birthday, staff.hire_date,staff.leaving_date]
        }
      end
    }
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    name = params["c0"]
    office = params['c1']
    order = params['c2']
    wage = params['c3']
    birthday = params['c4']
    hire_date = params['c5']
    leaving_date = params['c6']

    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      staff = staff.create :name => name, :office => office,  :order => order, :wage => wage, :birthday => birthday, :hire_date => hire_date,:leaving_date => leaving_date
      @tid = staff.id
      
    when "deleted"
      staff.find(@id).destroy
      @tid = @id 
      
    when "updated"
      staff = Staff.find(@id)
      staff.name = name
      staff.office = office
      staff.order = order
      staff.wage = wage
      staff.birthday = birthday
      staff.hire_date= hire_date
      staff.leaving_date = leaving_date         
	staff.save
      @tid = @id
    end
  end
end
