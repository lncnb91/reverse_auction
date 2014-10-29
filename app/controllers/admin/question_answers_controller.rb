class Admin::QuestionAnswersController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:show, :edit, :update, :destroy]

  def index
    @q = QuestionAnswer.search params[:q]
    @qas =  @q.result.page params[:page]
  end

  def edit
  end

  def update
    @qa.attributes = qa_params
    @qa.answered = true
    if @qa.save
      redirect_to admin_question_answers_path, notice: I18n.t(:success)
      UserMailer.answer_email(@qa).deliver
    else
      render :edit
    end
  end

  def destroy
    if @qa.destroy
      redirect_to :back, notice: I18n.t(:success)
    else
      redirect_to :back
    end
  end

  private
  def build_object
    @qa = QuestionAnswer.new
  end

  def set_object
    @qa = QuestionAnswer.find params[:id]
  end

  def qa_params
    params.require(:question_answer).permit QuestionAnswer::UPDATABLE_COLUMNS_FOR_QA
  end
end
