puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! first_name: 'First', last_name: 'User', email: 'user@example.com', password: 'please', password_confirmation: 'please'
user.confirm!
puts 'New user created: ' << user.full_name
user2 = User.create! first_name: 'Second', last_name: 'User', email: 'user2@example.com', password: 'please', password_confirmation: 'please'
user2.confirm!
puts 'New user created: ' << user2.full_name
user.add_role :admin

