# frozen_string_literal: true

class Task < ApplicationRecord
  include TasksStateMachine

  belongs_to :author, class_name: 'User', validate: true
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, :description, presence: true
  validates :description, length: { maximum: 500 }
end
