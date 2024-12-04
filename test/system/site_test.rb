require "application_system_test_case"

class ExampleTest < ApplicationSystemTestCase
  test "visiting the index" do
    Webdrivers::Chromedriver.required_version = '99.0.4844.51'
    visit root_url
    assert_selector "h1", text: "Welcome"
  end
end