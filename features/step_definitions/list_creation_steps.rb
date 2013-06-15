Given(/^I have (\d+) lists$/) do |arg1|
  @list = create(:category, name: "Home Renovation", user_id: @user.id)
  @list.set_category_uid
  @list.save
end

Then(/^I should be able to create a new list$/) do
  fill_in "category_name", with: "Groceries\n"
  page.should have_content "Groceries"
end

Then(/^I should be able to delete one of my lists$/) do
  within("li#category_#{@list.id}") do
    page.find(".delete-category").click
  end

  accept_confirm_dialog

  @user.reload
  last_category = @user.categories.last

  page.should have_content last_category.name
  expect(@user.categories.count).to eq 1
end

Then(/^I should not be able to delete my list$/) do
  within("li#category_#{@list.id}") do
    page.should_not have_css ".delete-category"
  end
end

Then(/^I should be able to edit my list$/) do
  # Initial list
  expect(@list.name).to eq "Dunzo"

  within("li#category_#{@list.id}") do
    page.find(".edit-category").click
  end

  within("#edit_category_#{@list.id}") do
    fill_in "category_name", with: "Edited Dunzo List"
    click_button "Update"
  end

  page.should have_content "Edited Dunzo List"

  @list.reload
  expect(@list.name).to eq "Edited Dunzo List"
end
