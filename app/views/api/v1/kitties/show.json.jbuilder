json.success Settings.success
case params[:show]
when Settings.api_keyword.kitty.show.sweets
  json.normal_apple @kitty.normal_apple
  json.golden_apple @kitty.golden_apple
when Settings.api_keyword.kitty.show.progress
  json.remained_point @user.remained_point
  json.level @kitty.level
  json.progress @kitty.progress
else
end
