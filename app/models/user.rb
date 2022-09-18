# frozen_string_literal: true

class User < ApplicationRecord
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id

  validates_presence_of :first_name, :last_name, :email
  validates_length_of :first_name, :last_name, minimum: 2
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_uniqueness_of :email

  has_secure_password
end
