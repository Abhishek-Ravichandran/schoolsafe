Given(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the SchoolSafe title$/) do
  assert page.has_content?("schoolsafe")
end

Then(/^I should see the toolbar option Home$/) do
  assert page.has_content?("Home")
end

Then(/^I should see the toolbar option Log in$/) do
  assert page.has_content?("Log in")
end

Then(/^I should see the toolbar option About$/) do
  assert page.has_content?("About")
end

Then(/^I should see the map$/) do
  driver = Selenium::WebDriver.for :firefox
  driver.find_element(:id, "map")
  driver.quit
end
