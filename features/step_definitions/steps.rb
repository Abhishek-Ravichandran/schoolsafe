Given(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the 'SchoolSafe' logo$/) do
  assert page.has_content?("schoolsafe")
end

Then(/^I should see the toolbar option 'Home'$/) do
  assert page.has_content?("Home")
end

Then(/^I should see the toolbar option 'Log in'$/) do
  assert page.has_content?("Log in")
end

Then(/^I should see the toolbar option 'About'$/) do
  assert page.has_content?("About")
end

Then (/^I should see the map$/) do
    page.find_by_id("map")
end

Then (/^I should see a list of schools$/) do
    page.find_by_id("list")
end

Then (/^I should see a search bar$/) do
    page.find(:xpath, '//div[@class="col-sm-3 col-md-3"]/form[@role="search"]')
end

When (/^I click the 'About' link$/) do
  click_link "About"
end

Then (/^I should see the 'About' page$/) do
  assert page.has_content?("The SchoolSafe application evaluates the safety of schools in the Philadelphia area.")
end

When(/^I enter all the fields of the review$/) do
  @review = Review.new do |r|
    r.title = "Title"
    r.rating = 3
    r.comment = "Hey, here's a comment!"
  end
  @review.save
end

Then(/^I should be able to save it to the database$/) do
  assert_not_nil Review.first
end

When(/^I enter at least one incorrect field$/) do
  @review = Review.new do |r|
    r.title = "Title"
    r.rating = 6 #rating must be less than 6
    r.comment = "Hey, here's a comment!"
  end
  @review.save
end

Then(/^I should not be able to save it to the database$/) do
  assert_equal Review.all.size, 0
end

When(/^I enter all the registration fields correctly$/) do
  @user = User.new do |u|
    u.name = "Ima User"
    u.description = "Researching schools"
  end
  @user.save
end

Then(/^I should be able to register an account$/) do
  assert_not_nil User.first
end

When(/^I enter at least one incorrect registration field$/) do
  @user = User.new do |u|
    u.name = "Ima User"
    u.description = ""
  end
  @user.save
end

Then(/^I should not be able to register an account$/) do
  assert_equal Review.all.size, 0
  # include below addition when view is implemented
  #assert page.has_content? "Your description must be at least"
end

