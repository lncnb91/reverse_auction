class Admin::UsersController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    params[:q].present? && params[:created_at_month_cont].present?
    @q = User.search params[:q]
    time_now = Time.now
    @exchange_by_month =
      Exchange.exchange_by_month(params[:created_at] || time_now.strftime("%Y-%m")).sum(:point)
    @today_exchange = Exchange.today_exchange(time_now.strftime("%Y-%m-d")).sum(:point)
    @users = @q.result
  end

  def new
  end

  def create
    @user.attributes = user_params
    if @user.save
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private
  def build_object
    @user = User.new
  end

  def user_params
    params.require(:user).permit User::UPDATABLE_COLUMNS_FOR_USERS
  end

  def set_object
    @user = User.find params[:user_id]
  end
end
