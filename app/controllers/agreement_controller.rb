class AgreementController < ApplicationController
  def index
  	@argreements_grid = initialize_grid(Argreement)
  end

end
