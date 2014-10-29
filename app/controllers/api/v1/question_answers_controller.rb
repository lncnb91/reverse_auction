class Api::V1::QuestionAnswersController < Api::BaseApiController
  before_action :build_object, only: [:create]
  handle_as_internal_server_error Adways::Error::API::QuestionAnswer::CannotCreate,
    error_code: Adways::Error::CODES[:question_create_failed]

  def create
    @qa.attributes = qa_params
    @qa.save
  end

  private
  def build_object
    @qa = QuestionAnswer.new
  end

  def set_object
    @qa = QuestionAnswer.find params[:id]
  end

  def qa_params
    params.require(:qa).permit QuestionAnswer::UPDATABLE_COLUMNS_FOR_QA_BY_API
  end
end
