require 'sequel'
require_relative '../../app/models/task_manager'

TaskManager.database.create_table :tasks do
  primary_key :id
  String :title
  String :description
end
