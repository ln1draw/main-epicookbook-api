FactoryGirl.define do
  factory :recipe do
    name 'Test recipe'
    verified false
    makes "An amount"
    blurb "What a cool recipe"
    image "MyString"
    user_id 1
    prep_time 1
    inactive_time 1
  end
end
