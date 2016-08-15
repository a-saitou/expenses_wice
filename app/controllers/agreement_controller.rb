class AgreementController < ApplicationController
  def index
  	@agreements_grid = initialize_grid(Agreement, 
  		include: :orderer,
      order:    'orderers.name',
      per_page: 20)
  end
  # GET /agreements/1
  # GET /agreements/1.json
  def show
    @agreement = Agreement.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agreement }
    end
  end

  # GET /agreements/new
  # GET /agreements/new.json
  def new
    @agreement = Agreement.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agreement }
    end
  end

  # GET /agreements/1/edit
  def edit
    @agreement = Agreement.find(params[:id])
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(params[:agreement])
    respond_to do |format|
      if @agreement.save
        #format.html { redirect_to @agreement, notice: 'agreement was successfully created.' }
        format.html { redirect_to agreements_url }
        format.json { render json: @agreement, status: :created, location: @agreement }
      else
        format.html { render action: "new" }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agreements/1
  # PUT /agreements/1.json
  def update
    @agreement = Agreement.find(params[:id])
    respond_to do |format|
      if @agreement.update_attributes(params[:agreement])
        format.html { redirect_to @agreement, notice: 'agreement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to agreements_url }
      format.json { head :no_content }
    end
  end
end
