# frozen_string_literal: true

class User < ApplicationRecord
  has_many :my_tasks, class_name: 'Task',
                      foreign_key: :author_id,
                      inverse_of: 'author',
                      dependent: :nullify

  has_many :assigned_tasks, class_name: 'Task',
                            foreign_key: :assignee_id,
                            inverse_of: 'assignee',
                            dependent: :nullify

  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true

  has_secure_password
end
