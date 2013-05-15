def new_user
  @visitor ||= { first_name: "Testy", last_name: "McUserton", username: 'testymcuserton', email: "user@example.com",
    password: "password", password_confirmation: "password" }
  @user = create(:user, email: @visitor[:email], username: @visitor[:username], password: @visitor[:password], password_confirmation: @visitor[:password_confirmation])
end

When /^I visit the home page$/ do
  visit root_path
end

Then(/^I should see the buttons "(.*?)" and "(.*?)"$/) do |login, create_account|
  page.should have_content login
  page.should have_content create_account
end

When /^I click a button "([^"]*)"$/ do |arg1|
  click_link (arg1)
end

Then(/^I should see a form with a field "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  page.should have_css "#user_email"
  page.should have_css "#user_password"
end

Then /^I should see a message "([^\"]*)"$/ do |arg1|
  page.should have_content (arg1)
end

Then /^my email address should be stored in the database$/ do
  test_user = User.find_by_email("example@example.com")
  test_user.should respond_to(:email)
end

Then /^my account should be unconfirmed$/ do
  test_user = User.find_by_email("example@example.com")
  test_user.confirmed_at.should be_nil
end
