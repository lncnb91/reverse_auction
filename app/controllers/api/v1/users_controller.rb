class Api::V1::UsersController < Api::BaseApiController
  skip_before_action :check_access_token, only: [:create, :update]
  before_action :set_object, only: :update
  before_action :build_object, only: :create
  handle_as_internal_server_error Adways::Error::API::User::UserExchange,
    error_code: Adways::Error::CODES[:not_enough_point]
  handle_as_internal_server_error Adways::Error::API::GiftItem::NotEnoughPoint,
    error_code: Adways::Error::CODES[:not_enough_point]

  def show
  end

  def create
    @user.ad_id = params[:ad_id]
    @user.device_type = params[:device_type]
    if @user.save
      @session = @user.create_session
    else
      raise ActiveRecord::RecordNotSaved
        .new(I18n.t :can_not_create_user, scope: [:errors, :messages])
    end
  end

  def update
    case params[:update]
    when Settings.api_keyword.user.update.exchange
      check_access_token
      check_gift_item
      @user.make_exchange(params[:gift_item_id], params[:point])
      unless @user.save
        raise Adways::Error::API::User::UserExchange
          .new(I18n.t :exchange_point_insufficient, scope: [:errors, :messages])
      end
    when Settings.api_keyword.user.update.retrieve
      @user = User.find_by user_id: params[:user_id]
      @user.ad_id = params[:ad_id]
      @user.device_type = params[:device_type]
      if @user.save
        @session = @user.create_session
        @login_bonus = @user.check_login_bonus
        @first_login_on_day = @login_bonus == 0 ? 0 : 1
      else
        raise ActiveRecord::RecordNotSaved
          .new(I18n.t :can_not_update_user, scope: [:errors, :messages])
      end
    end
  end

  def destroy
    @user.destroy
  end

  private
  def build_object
    @user = User.new
  end

  def set_object
    @user = User.find params[:user_id]
  end

  def check_gift_item
    item = GiftItem.find params[:gift_item_id]
    unless item.point <= params[:point].to_i
      raise Adways::Error::API::GiftItem::NotEnoughPoint
        .new(I18n.t :gift_item_point_insufficient, scope: [:errors, :messages])
    end
  end

  def check_access_token
    @user = Session.get_user params[:access_token]
  end
end
