require_relative '../test_helper'

class UserCreatesTasksTest < FeatureTest
  def test_new_task_redirects_to_index
    visit '/tasks/new'
    fill_in "task[title]", with: "First title"
    fill_in "task[description]", with: "First description"
    click_button "submit"

    assert_equal '/tasks', current_path
  end

  def test_new_task_is_in_index
    visit "/tasks/new"
    fill_in "task[title]", with: "First title"
    fill_in "task[description]", with: "First description"
    click_button "submit"

    assert page.has_content?('First title')
  end
end
