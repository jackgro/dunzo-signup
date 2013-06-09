# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    first_name 'Test'
    last_name 'User'
    sequence(:username) { |n| "testuser-#{n}" }
    sequence(:email) { |n| "example#{n}@example.com" }
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end
