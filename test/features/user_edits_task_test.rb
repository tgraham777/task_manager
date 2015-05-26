require_relative '../test_helper'

class UserEditsTasksTest < FeatureTest
  def test_edit_view_has_title
    visit '/tasks/16/edit'
    assert page.has_content?("Edit task #16")
  end

  def test_can_change_title
    TaskManager.create(title: "practice", description: "capybara")

    visit '/tasks'
    click_link "Edit"
    assert_equal '/tasks/1/edit', current_path

    fill_in "task[title]", with: "Practice SQL"
    fill_in "task[description]", with: "tomorrow"
    click_button "submit"

    assert page.has_content?("Practice SQL")
    assert page.has_content?("tomorrow")

    refute page.has_content?("capybara")
  end
end
