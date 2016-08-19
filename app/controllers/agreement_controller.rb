class AgreementController < ApplicationController
   before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  def index
  	@agreements_grid = initialize_grid(Agreement, 
      include: [:orderer])
  end
  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  # GET /agreements/new.json
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
  
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)
    respond_to do |format|
      if @agreement.save
        #format.html { redirect_to @agreement, notice: 'agreement was successfully created.' }
        format.html { redirect_to agreements_url }
        format.json { render json: @agreement, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agreements/1
  # PUT /agreements/1.json
  def update
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'agreement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement = Agreement.find(params[:id])
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url , notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:name, :abbreviation,:code,:orderer_id,:constraction_date,:completion_date)
    end


end
