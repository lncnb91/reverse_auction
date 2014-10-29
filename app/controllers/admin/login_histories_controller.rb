class Admin::LoginHistoriesController < Admin::BaseController
  before_action :set_object, only: [:show]

  def index
    @q = LoginHistory.search params[:q]
    @login_histories = @q.result
  end

  def show
  end

  private
  def set_object
    @login_history = LoginHistory.find params[:id]
  end
end
