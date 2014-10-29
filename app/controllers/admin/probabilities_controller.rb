class Admin::ProbabilitiesController < Admin::BaseController
  before_action :set_object, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    @probability.attributes = probabilities_params
    if @probability.save
      redirect_to admin_probability_path(@probability)
    else
      redirect_to :back
    end
  end

  private
  def set_object
    @probability = Probability.first
  end

  def probabilities_params
    params.require(:probability).permit Probability::UPDATABLE_COLUMNS_FOR_ADMINS
  end
end