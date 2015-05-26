require_relative '../test_helper'

class UserDeletesTasksTest < FeatureTest
  def test_can_delete_task
    TaskManager.create(title: "practice", description: "capybara")

    visit '/tasks'
    click_link_or_button "Delete"

    refute page.has_content?("practice")
    refute page.has_content?("capybara")
  end
end
