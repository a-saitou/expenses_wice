class OrdererController < ApplicationController
		before_action :set_orderer, only: [:show, :edit, :update, :destroy]
  def index
  	@orderers_grid = initialize_grid(Orderer)
  end

  # GET /orderers/1
  # GET /orderers/1.json
  def show
  end

  # GET /orderers/new
  # GET /orderers/new.json
  def new
    @orderer = Orderer.new
  end

  # GET /orderers/1/edit
  def edit
  
  end

  # POST /orderers
  # POST /orderers.json
  def create
    @orderer = Orderer.new(orderer_params)
    respond_to do |format|
      if @orderer.save
        #format.html { redirect_to @orderer, notice: 'orderer was successfully created.' }
        format.html { redirect_to orderers_url }
        format.json { render json: @orderer, status: :created, location: @orderer }
      else
        format.html { render :new }
        format.json { render json: @orderer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orderers/1
  # PUT /orderers/1.json
  def update
    respond_to do |format|
      if @orderer.update(orderer_params)
        format.html { redirect_to @orderer, notice: 'orderer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @orderer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderers/1
  # DELETE /orderers/1.json
  def destroy
    @orderer = Orderer.find(params[:id])
    @orderer.destroy
    respond_to do |format|
      format.html { redirect_to orderers_url , notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderer
      @orderer = Orderer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderer_params
      params.require(:orderer).permit(:name)
    end
end
