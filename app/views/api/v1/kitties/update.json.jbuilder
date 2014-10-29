json.success Settings.success
case params[:update]
when Settings.api_keyword.kitty.update.sweets
  json.level_up @kitty.level_up_flag
  json.level @kitty.level
  json.progress @kitty.progress
  json.normal_apple @kitty.normal_apple
  json.golden_apple @kitty.golden_apple
else
end