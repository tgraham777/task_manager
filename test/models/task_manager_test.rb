require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(TaskManager.all.last.id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal TaskManager.all.last.id, task.id
  end

  def test_it_grabs_all
    first_count = TaskManager.all.count
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    TaskManager.create({ :title       => "another title",
                         :description => "another description"})
    assert_equal first_count+2, TaskManager.all.count

    TaskManager.create({ :title       => "yet another title",
                         :description => "yet another description"})
    assert_equal first_count+3, TaskManager.all.count
  end

  def create_tasks(num)
    num.times do |x|
      TaskManager.create(title: "task#{x}",
                         description: "description#{x}")
    end
  end

  def test_it_finds
    first_count = TaskManager.all.count

    create_tasks(4)
    task = TaskManager.find(TaskManager.all.last.id)

    assert_equal "task3", task.title
    assert_equal "description3", task.description
    assert_equal TaskManager.all.last.id, task.id
  end

  def test_it_updates
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(TaskManager.all.last.id)
    assert_equal TaskManager.all.last.id, task.id

    new_task = {:title => "blah", :description => "blah2"}
    TaskManager.update(TaskManager.all.last.id, new_task)

    task = TaskManager.find(TaskManager.all.last.id)
    assert_equal "blah", task.title
    assert_equal "blah2", task.description
  end

  def test_it_deletes
    TaskManager.delete_all
    first_count = TaskManager.all.count

    create_tasks(2)
    assert_equal first_count+2, TaskManager.all.count
    
    TaskManager.delete(TaskManager.all.last.id)
    assert_equal first_count+1, TaskManager.all.count
  end
end
