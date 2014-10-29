class Admin::ChargeLogsController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @q = ChargeLog.search params[:q]
    @charge_logs = @q.result
  end

  def new
  end

  def create
    @charge_log.attributes = user_params
    if @charge_log.save
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @charge_log.destroy
    redirect_to admin_users_path
  end

  private
  def build_object
    @charge_log = ChargeLog.new
  end

  def user_params
    params.require(:charge_log).permit ChargeLog::UPDATABLE_COLUMNS_FOR_CHARGE_LOGS
  end

  def set_object
    @charge_log = ChargeLog.find params[:user_id]
  end
end
