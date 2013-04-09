namespace :users do
  desc "Set initial user data for existing users"

  task :assign_initial_list => :environment do
    User.find_each do |user|
      @category = Category.create!(name: 'Dunzo')
      @category.user_id = user.id
      @category.set_category_uid
      @category.save
      @category.tasks.create(name: 'Make a new list', date: Date.today, position: 0)
      @category.tasks.create(name: 'Use the form in the sidebar to add one', date: Date.today, position: 1)
      @category.tasks.create(name: 'Add tasks to your new list', date: Date.today, position: 2)
    end
  end
end
