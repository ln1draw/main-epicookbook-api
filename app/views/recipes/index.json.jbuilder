json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, 
  :verified, :blurb, :image, :user_id, 
  :prep_time, :inactive_time
end
# this should eventually have directions
# and ingredients