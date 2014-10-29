class Api::V1::CommonQuestionAnswersController < Api::BaseApiController

  def index
    @common_qas = CommonQuestionAnswer.all
  end
end
