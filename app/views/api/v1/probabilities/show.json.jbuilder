json.success Settings.success
json.playable @playable
if @playable == 1
  json.fail @probability.fail
  json.one_apple @probability.one_apple
  json.three_apple @probability.three_apple
  json.golden_apple @probability.golden_apple
end