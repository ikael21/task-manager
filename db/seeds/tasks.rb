# frozen_string_literal: true

ADMIN_EMAIL = 'anton.admin@taskmanager.com'

def task_params
  {
    name: 'Task',
    description: 'Description',
    author_id: Admin.find_by(email: ADMIN_EMAIL).id,
  }
end

puts('Add Tasks')
3.times { Task.create(task_params) }
