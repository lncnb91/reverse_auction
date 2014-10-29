json.success Settings.success
if params[:update] == Settings.api_keyword.user.update.retrieve
  json.access_token @session.access_token
  json.continuos_login_count @user.continuos_login_count
  json.login_bonus @login_bonus
  json.remained_point @user.remained_point
  json.first_login_on_day @first_login_on_day
  json.kitty_word_newest_version 2
  json.user_id @user.user_id
end
