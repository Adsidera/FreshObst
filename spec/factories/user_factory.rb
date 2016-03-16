FactoryGirl.define do
    factory :user do
        email "peter@example.com"
        password "23456789"
        first_name "Peter"
        last_name "Example"
        admin false
    end
end