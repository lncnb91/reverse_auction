class Admin::CommonQuestionAnswersController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @q = CommonQuestionAnswer.search params[:q]
    @common_qas =  @q.result.page params[:page]
  end

  def new
  end

  def create
    @common_qa.attributes = common_qa_params
    if @common_qa.save
      redirect_to admin_common_question_answers_path , notice: I18n.t(:success)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @common_qa.attributes = common_qa_params
    if @common_qa.save
      redirect_to admin_common_question_answers_path, notice: I18n.t(:success)
    else
      render :edit
    end
  end

  def destroy
    if @common_qa.destroy
      redirect_to :back, notice: I18n.t(:success)
    else
      redirect_to :back
    end
  end

  private
  def build_object
    @common_qa = CommonQuestionAnswer.new
  end

  def set_object
    @common_qa = CommonQuestionAnswer.find params[:id]
  end

  def common_qa_params
    params.require(:common_question_answer).permit CommonQuestionAnswer::UPDATABLE_COLUMNS_FOR_COMMON_QA
  end
end