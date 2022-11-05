# frozen_string_literal: true

FactoryBot.define do
  factory :developer do
    first_name
    last_name
    password
    email { "#{first_name}.developer@example.com".downcase }
    avatar { 'MyString' }
  end
end
