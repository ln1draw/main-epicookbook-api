json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, 
  :verified, :blurb, :image, :uid, 
  :prep_time, :inactive_time
end
# this should eventually have directions
# and ingredients