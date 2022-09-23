# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create' do
    task = create(:task)

    assert task.persisted?
    assert_equal('Manager', task.author.type)
    assert_equal('Developer', task.assignee.type)
  end

  test 'initial state is new_task' do
    task = create(:task)
    expected_state = 'new_task'

    assert_equal(expected_state, task.state)
  end

  test '#develop - should move state from new_task to in_development' do
    task = create(:task, state: 'new_task')

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end

  test '#develop - should move state from in_qa to in_development' do
    task = create(:task, state: 'in_qa')

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end

  test '#develop - should move state from in_code_review to in_development' do
    task = create(:task, state: 'in_code_review')

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end
end
