# frozen_string_literal: true

module TasksStateMachine
  extend ActiveSupport::Concern

  included do
    state_machine initial: :new_task do
      state :new_task
      state :in_development
      state :in_code_review
      state :in_qa
      state :ready_for_release
      state :released
      state :archived

      event :develop do
        transition [:new_task, :in_qa, :in_code_review] => :in_development
      end

      event :move_to_qa do
        transition :in_development => :in_qa
      end

      event :prepare_for_release do
        transition :in_code_review => :ready_for_release
      end

      event :release do
        transition :ready_for_release => :released
      end

      event :archive do
        transition [:new_task, :released] => :archived
      end
    end
  end
end
