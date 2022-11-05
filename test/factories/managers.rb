# frozen_string_literal: true

FactoryBot.define do
  factory :manager do
    first_name
    last_name
    password
    email { "#{first_name}.manager@example.com".downcase }
    avatar { 'MyString' }
  end
end
