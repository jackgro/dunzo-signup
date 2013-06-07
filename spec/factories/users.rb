# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    first_name 'Test'
    last_name 'User'
    sequence(:username) { |n| "testuser-#{n}" }
    sequence(:email) { |n| "user-#{n}@dunzoapp.com" }
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
    confirmation_sent_at Time.now
  end
end
