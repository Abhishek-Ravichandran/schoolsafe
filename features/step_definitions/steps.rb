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

Given(/^There is a school in the database$/) do
  @school = School.new do |s|
    s.name = "Capybara High School"
    s.address = "3401 Walnut Street"
    s.grade_level = "high"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

And(/^I am on the front page$/) do
  visit root_path
end

When (/^I click on the name of the school$/) do
  click_link('Capybara High School')
end

Then (/^I should be directed to the school's page$/) do
  assert page.has_content?('Capybara High School')
end

And(/^I am on the new review form page$/) do
  visit new_review_path
end

When(/^I fill in all the fields$/) do
  fill_in('Title', :with => 'My Review')
  fill_in('Rating', :with => 3)
  fill_in('Comment', :with => 'Here is my comment.')
  fill_in('School', :with => 1)
end

And(/^I click Create Review$/) do
  click_button('Create Review')
end

Then(/^I should see "Review was successfully created."$/) do
  assert page.has_content?("Review was successfully created.")
end

When(/^I do not fill in all the fields$/) do
  fill_in('Title', :with => 'My Review')
  fill_in('School', :with => 1)
end

Then(/^I should see "3 errors prohibited this review from being saved:"$/) do
  assert page.has_content?("3 errors prohibited this review from being saved")
end

Given(/^There are two schools in the database$/) do
  @first_school = School.new do |s|
    s.name = "Capybara High School"
    s.address = "3401 Walnut Street"
    s.grade_level = "high"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @first_school.save
  @second_school = School.new do |s|
    s.name = "Capybara Elementary"
    s.address = "3402 Walnut Street"
    s.grade_level = "elem"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @second_school.save
end

And(/^I am on the main page$/) do
  visit root_path
end

When (/^I select a grade level$/) do
  check('elem')
end

And (/^I click Submit$/) do
  click_button("Submit")
end

Then (/^I should see the one school for that grade level$/) do
  page.assert_text("Capybara Elementary")
end

Then (/^I should see a search bar$/) do
    page.find('.input-group').find('input')
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
    r.school_id = 1
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
  assert_equal User.all.size, 0
  # include below addition when view is implemented
  #assert page.has_content? "Your description must be at least"
end

Given (/^I am on the root page$/) do
  visit root_path
end

When (/^I enter all the school fields correctly$/) do
  @school = School.new do |s|
    s.name = "Rails High"
    s.address = "1000 Ruby Lane"
    s.zipcode = "19104"
    s.grade_level = "High"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

Then(/^I should be able to create a new school$/) do
  assert_not_nil School.first
end

When (/^I enter at least one incorrect school field$/) do
  @school = School.new do |s|
    s.name = "Rails High"
    s.address = "1000 Ruby Lane"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

Then(/^I should not be able to create a new school$/) do
  assert_equal School.all.size, 0
end

Given (/^I am on the new account page$/) do
  visit signup_path
end

When (/^I enter all the signup fields correctly$/) do
  fill_in('Name', :with => 'Benjamin Franklin')
  fill_in('Description', :with => 'Gonna post some reviews of schools.')
  fill_in('Email', :with => 'bennyfranks@gmail.com')
  fill_in('Password', :with => 'upennisthebest')
  fill_in('Confirmation', :with => 'upennisthebest')
end

When (/^I don't enter all the signup fields correctly$/) do
  fill_in('Name', :with => 'Benjamin Franklin')
  fill_in('Description', :with => 'Gonna post some reviews of schools.')
  fill_in('Email', :with => 'bennyfranks@@gmail..com')
  fill_in('Password', :with => 'upennisthebest')
  fill_in('Confirmation', :with => 'upennisthebest')
end

And (/^I click the Create User button$/) do
  click_button('Create my account')
end

Then (/^I should be able to create an account$/) do
  assert page.has_content? 'User was successfully created.'
end

Then (/^I should see an error on the page$/) do
  assert page.has_content? "error"
end


    


