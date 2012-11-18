# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    task_id 1
    user_id 1
  end
end
