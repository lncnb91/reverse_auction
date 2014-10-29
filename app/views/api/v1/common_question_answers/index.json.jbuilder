json.success Settings.success
json.common_qas do
  json.array! @common_qas.each do |common_qa|
    json.title common_qa.title
    json.question common_qa.question
    json.answer common_qa.answer
  end
end
