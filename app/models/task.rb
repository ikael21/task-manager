# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates_presence_of :name, :author, :description
  validates_length_of :description, maximum: 500
end
