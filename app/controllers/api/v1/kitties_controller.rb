class Api::V1::KittiesController < Api::BaseApiController
  before_action :set_object, only: [:edit, :update, :show]
  handle_as_internal_server_error Adways::Error::API::Kitty::EatSweetFailed,
    error_code: Adways::Error::CODES[:kitty_eat_sweet_failed]
  handle_as_internal_server_error Adways::Error::API::Kitty::InvitationBonusFailed,
    error_code: Adways::Error::CODES[:invitation_bonus_failed]

  def show
  end

  def update
    case params[:update]
    when Settings.api_keyword.kitty.update.sweets
      unless @kitty.eat_sweets params[:type]
        raise Adways::Error::API::Kitty::EatSweetFailed
          .new("Kitty eat sweets failed")
      end
    when Settings.api_keyword.kitty.update.invitation
      friend = User.find_by invitation_code: params[:invitation_code]
      if @user.received_invitation_bonus_by? friend
        raise Adways::Error::API::Kitty::InvitationBonusFailed
          .new("Cannot get bonus")
      else
        @kitty.invitation_bonus
        friend.kitty.invitation_bonus
        @user.friends << friend
      end
    when Settings.api_keyword.kitty.update.daily_game_bonus
      case params[:daily_game_bonus]
      when 1
        @kitty.calc_sweet "normal_apple", 1
      when 2
        @kitty.calc_sweet "normal_apple", 3
      when 3
        @kitty.calc_sweet "golden_apple", 1
      else
      end
      if @kitty.save
        @user.update_attributes last_play: Date.today
      else
        raise ActiveRecord::RecordNotSaved
          .new(I18n.t :can_not_update_record, scope: [:errors, :messages])
      end
    else
    end
  end

  private
  def build_object
    @kitty = Kitty.new
  end

  def set_object
    @kitty = @user.kitty
  end
end
