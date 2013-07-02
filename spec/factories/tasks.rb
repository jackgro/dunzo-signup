# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "New task"
    date Date.today
    complete false
  end
end
