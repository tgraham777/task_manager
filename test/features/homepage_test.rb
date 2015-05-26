require_relative '../test_helper'

class HomePageTest < FeatureTest
  def test_welcome_message
    visit '/'
    within('#greeting') do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end
end
