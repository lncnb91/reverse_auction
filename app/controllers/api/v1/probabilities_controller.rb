class Api::V1::ProbabilitiesController < Api::BaseApiController
  before_action :set_object, only: :show
  def show
    @playable = (@user.last_play == Date.today) ? 0 : 1
  end

  private
  def set_object
    @probability = Probability.first
  end
end
