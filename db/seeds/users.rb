# frozen_string_literal: true

DEFAULT_PASSWORD = '12345678'

def user_params
  {
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: DEFAULT_PASSWORD,
  }
end

puts('Add Managers')
3.times { Manager.create(user_params) }

puts('Add Developers')
3.times { Developer.create(user_params) }

admin_params = {
  email: 'anton.admin@taskmanager.com',
  first_name: 'Anton',
  last_name: 'Yudin',
  password: DEFAULT_PASSWORD,
}

puts('Add Admin')
Admin.create(admin_params)
