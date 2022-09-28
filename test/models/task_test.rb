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
    task = create(:task, state: :new_task)

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end

  test '#develop - should move state from in_qa to in_development' do
    task = create(:task, state: :in_qa)

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end

  test '#develop - should move state from in_code_review to in_development' do
    task = create(:task, state: :in_code_review)

    task.develop

    expected_state = 'in_development'
    assert_equal(expected_state, task.state)
  end

  test '#send_for_code_review - should move state from in_development to in_code_review' do
    task = create(:task, state: :in_development)

    task.send_for_code_review

    expected_state = 'in_code_review'
    assert_equal(expected_state, task.state)
  end

  test '#move_to_qa - should move state from in_code_review to in_qa' do
    task = create(:task, state: :in_code_review)

    task.move_to_qa

    expected_state = 'in_qa'
    assert_equal(expected_state, task.state)
  end

  test '#prepare_for_release - should move state from in_qa to ready_for_release' do
    task = create(:task, state: :in_qa)

    task.prepare_for_release

    expected_state = 'ready_for_release'
    assert_equal(expected_state, task.state)
  end

  test '#release - should move state from ready_for_release to released' do
    task = create(:task, state: :ready_for_release)

    task.release

    expected_state = 'released'
    assert_equal(expected_state, task.state)
  end

  test '#archive - should move state from new_task to archived' do
    task = create(:task, state: :new_task)

    task.archive

    expected_state = 'archived'
    assert_equal(expected_state, task.state)
  end

  test '#archive - should move state from released to archived' do
    task = create(:task, state: :released)

    task.archive

    expected_state = 'archived'
    assert_equal(expected_state, task.state)
  end
end
