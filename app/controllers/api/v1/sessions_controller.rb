class Api::V1::SessionsController < Api::BaseApiController
  skip_before_action :check_access_token
  def create
    @user = User.find_by user_id: params[:user_id], ad_id: params[:ad_id]
    raise ActiveRecord::RecordNotFound
      .new(I18n.t :record_not_found, scope: [:errors, :messages]) unless @user
    @session = Session.check_for_login @user.user_id
    @login_bonus = @user.check_login_bonus
    @first_login_on_day = (@login_bonus == 0) ? 0 : 1
  end
end
