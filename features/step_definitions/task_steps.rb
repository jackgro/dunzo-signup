Given(/^I have a list with a complete task$/) do
  @list = create(:list, user: @user)
  @task = create(:task, list: @list, complete: true)
end

When(/^I create a new task for my list$/) do
  fill_in "task_name", with: "New task\n"
  page.should have_content "New task"
  @task = Task.last
end

Then(/^I should be able to create a new task for my list$/) do
  fill_in "task_name", with: "New task\n"
  page.should have_content "New task"
end

Then(/^I should be able to delete a task for my list$/) do
  @task = @list.tasks.first
  page.should have_content @task.name

  within "#edit_task_#{@task.id}" do
    page.find(".delete-task").click
  end

  expect(@user.tasks).to_not include @task
end

Then(/^I should be able to mark the task as complete$/) do
  find('label', text: @task.name).click

  page.should have_css ".complete"

  @task.reload
  expect(@task.complete).to be_true
end

Then(/^I should be able to mark the task as incomplete$/) do
  find('label', text: @task.name).click

  page.should_not have_css ".complete"

  @task.reload
  expect(@task.complete).to be_false
end
