json.success Settings.success
if @news
  json.title @news.title
  json.content @news.content
  json.created_at @news.created_at.time_to_date
  json.updated_at @news.updated_at.time_to_date
end
