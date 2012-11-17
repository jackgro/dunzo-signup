# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :categorization do
    user_id 1
    task_id 1
    name "MyString"
  end
end
