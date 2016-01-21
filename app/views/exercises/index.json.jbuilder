json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :text
  json.url exercise_url(exercise, format: :json)
end
