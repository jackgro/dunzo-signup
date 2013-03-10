puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! first_name: 'First', last_name: 'User', email: 'user@example.com', password: 'please', password_confirmation: 'please'
user.confirm!
puts 'New user created: ' << user.full_name

user2 = User.create! first_name: 'Second', last_name: 'User', email: 'user2@example.com', password: 'please', password_confirmation: 'please'
user2.confirm!
puts 'New user created: ' << user2.full_name
user.add_role :admin

sean = User.create! first_name: 'Sean', last_name: 'Taylor', email: 'seanpt@me.com', password: 'please', password_confirmation: 'please'
sean.confirm!
puts 'New user created: ' << sean.full_name
sean.add_role :admin

jack = User.create! first_name: 'Jack', last_name: 'Grossmann', email: 'jtg028@gmail.com', password: 'please', password_confirmation: 'please'
jack.confirm!
puts 'New user created: ' << jack.full_name
jack.add_role :admin
