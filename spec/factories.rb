# == Users ==
FactoryGirl.define do
 factory :user do |c|
   c.name "Test"
   c.email  "test@gmail.com"
 end

end

FactoryGirl.define do
 factory :movie do |c|
   c.title "Dhoom"
   c.genre "Action"
   c.year "2013"
   
 end
end
FactoryGirl.define do
 factory :like do |c|
   c.movie_id "1"
   c.user_id "1"
 end
end


