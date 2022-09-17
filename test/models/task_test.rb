# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create' do
    task = create(:task)

    assert task.persisted?
    assert_equal('Manager', task.author.type)
    assert_equal('Developer', task.assignee.type)
  end
end
