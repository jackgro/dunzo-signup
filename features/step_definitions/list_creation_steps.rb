Given(/^I have (\d+) lists$/) do |arg1|
  @list = create(:list, name: "Home Renovation", user_id: @user.id)
  @list.set_list_uid
  @list.save
end

When(/^I create a new list$/) do
  fill_in "category_name", with: "Groceries\n"
  page.should have_content "Groceries"
  @list = Category.last
end

When(/^I visit the page for my list$/) do
  visit username_category_path(@user.slug, @list.category_uid)
end

Then(/^I should be able to create a new list$/) do
  fill_in "list_name", with: "Groceries\n"
  page.should have_content "Groceries"
end

Then(/^I should be able to delete one of my lists$/) do
  within("li#list_#{@list.id}") do
    page.find(".delete-list").click
  end

  accept_confirm_dialog

  @user.reload
  last_list = @user.lists.last

  page.should have_content last_list.name
  expect(@user.lists.count).to eq 1
end

Then(/^I should not be able to delete my list$/) do
  within("li#list_#{@list.id}") do
    page.should_not have_css ".delete-list"
  end
end

Then(/^I should be able to edit my list$/) do
  # Initial list
  expect(@list.name).to eq "Dunzo"

  within("li#list_#{@list.id}") do
    page.find(".edit-list").click
  end

  within("#edit_list_#{@list.id}") do
    fill_in "list_name", with: "Edited Dunzo List"
    click_button "Update"
  end

  page.should have_content "Edited Dunzo List"

  @list.reload
  expect(@list.name).to eq "Edited Dunzo List"
end

Then(/^I should have a list called "(.*?)"$/) do |arg1|
  list = List.find_by_name(arg1)
  expect(@user.lists).to include list
  page.should have_content arg1
end
