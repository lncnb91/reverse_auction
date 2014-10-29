json.success Settings.success
json.sanrio_links @sanrio_links.each do |sanrio_link|
  json.id sanrio_link.id
  json.title sanrio_link.title
  json.description sanrio_link.description
  json.image_logo sanrio_link.logo_link
  json.link sanrio_link.link
  json.date sanrio_link.created_at.to_i
end
