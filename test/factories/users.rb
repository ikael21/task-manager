# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name
    last_name
    password
    email { "#{first_name}@example.com".downcase }
    avatar { 'MyString' }
  end
end
