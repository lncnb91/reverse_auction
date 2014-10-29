class Admin::PricingPlaysController < Admin::BaseController
  before_action :build_object, only: [:new, :create]
  before_action :set_object, only: [:edit, :update, :destroy]

  def index
    @q = PricingPlay.search params[:q]
    @pricing_plays = @q.result
  end

  def new
  end

  def create
    @pricing_play.attributes = pricing_play_params
    if @pricing_play.save
      redirect_to :back, notice: "success"
    else
      render :new
    end
  end

  def destroy
    @pricing_play.destroy
    redirect_to admin_users_path
  end

  private
  def build_object
    @pricing_play = PricingPlay.new
  end

  def pricing_play_params
    params.require(:pricing_play).permit PricingPlay::UPDATABLE_COLUMNS_FOR_USERS
  end

  def set_object
    @pricing_play = PricingPlay.find params[:user_id]
  end
end
