class AgreementController < ApplicationController
  def index
  end

  def data
    agreements = Agreement.all
    
    render :json => {
      :total_count => agreements.length,
      :pos => 0,
      :rows => agreements.map do |agreement|
        {
          :id => agreement.id,
          :data => [agreement.name, agreement.abbreviation,agreement.number, agreement.constraction_date, agreement.completion_date, agreement.orderer_id]
        }
      end
    }
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    name = params["c0"]
    abbreviation = params['c1']
    number = params['c2']
    constraction_date = params['c3']
    completion_date = params['c4']
    orderer_id = params['c5']   
    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      agreement = agreement.create :name => name, :abbreviation => abbreviation,:number => number, :constraction_date => constraction_date, :completion_date=> completion_date, :orderer_id => orderer_id
      @tid = agreement.id
      
    when "deleted"
      agreement.find(@id).destroy
      @tid = @id 
      
    when "updated"
      agreement = Agreement.find(@id)
      agreement.name = name
      agreement.abbreviation = abbreviation
      agreement.number = number
      agreement.constraction_date = constraction_date
      agreement.completion_date = completion_date
      agreement.orderer_id = orderer_id    
	agreement.save
      @tid = @id
    end
  end
end
