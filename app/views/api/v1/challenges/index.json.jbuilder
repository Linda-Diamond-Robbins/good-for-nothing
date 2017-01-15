json.array! @challenges.each do |challenge|
  json.id challenge.id
  json.title challenge.title
  json.description challenge.description
  json.created_at challenge.created_at
end
