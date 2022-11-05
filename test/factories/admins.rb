# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    first_name
    last_name
    password
    email { "#{first_name}.admin@example.com".downcase }
    avatar { 'MyString' }
  end
end
