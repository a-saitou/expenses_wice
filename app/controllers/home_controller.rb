class HomeController < ApplicationController
  def index
  end
  def data
   works = Work.all

   render :json => works.map {|work| {
              :id => work.id,
              :start_date => work.start_date.to_formatted_s(:db),
              :end_date => work.end_date.to_formatted_s(:db),
              :text => work.note
          }}
   end
   def db_action
   	mode = params["!nativeeditor_status"]
   	id = params["id"]
   	start_date = params["start_date"]
   	end_date = params["end_date"]
   	note = params["note"]

   	case mode
     	when "inserted"
      	 work = Work.create :start_date => start_date, :end_date => end_date, :note => note
       	tid = work.id

     	when "deleted"
      	 Work.find(id).destroy
      	 tid = id

     	when "updated"
      	 work = Work.find(id)
      	 work.start_date = start_date
      	 work.end_date = end_date
      	 work.note = note
      	 work.save
     	  tid = id
   	end

   	render :json => {
              :type => mode,
              :sid => id,
              :tid => tid,
          }
 	end
 end
