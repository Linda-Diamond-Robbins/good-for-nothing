json.array! @challenges.each do |challenge|
  json.id challenge.id
  json.title challenge.title
  json.description challenge.description
  json.created_at challenge.created_at
  json.friendly_date challenge.friendly_date
  json.category_list challenge.cat_list
  json.categories challenge.categories.each do |category|
    json.id category.id
    json.name category.name
  end
end
