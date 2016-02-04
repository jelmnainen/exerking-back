json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :title, :text, :deadline 
  json.url exercise_url(exercise, format: :json)
end
