class AgreementController < ApplicationController
  def index
  	@agreements_grid = initialize_grid(Agreement)
  end

end
