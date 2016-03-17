#defines first and future factories
FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    email 
    password "123456789"
    first_name "Peter"
    last_name "Example"
  end
  factory :admin, class: User do
    email 
    password "qwertzuiopui"
    admin true
    first_name "Admin"
    last_name "User"
  end
end