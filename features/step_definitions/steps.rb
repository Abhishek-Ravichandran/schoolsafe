World(ShowMeTheCookies)

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
  click_link @school.name
end

Then (/^I should be directed to the school's page$/) do
  page.find(:css, 'div#crimes_filter')
  page.find(:css, 'div#crimes-list')
  page.find(:css, 'div#reviews-list')
end

When (/^I click the 'Post a Review' button$/) do
  click_link "Post a Review"
end

And (/^I should see a form to post a review$/) do
  assert page.has_content? "New Review"
end

# And(/^I am on the new review form page$/) do
#   visit new_review_path
# end

When(/^I fill in all the fields$/) do
  fill_in('Title', :with => 'My Review')
  fill_in('Rating', :with => 3)
  fill_in('Comment', :with => 'Here is my comment.')
end

And(/^I click Create Review$/) do
  click_button('Create Review')
end

Then(/^I should see "Review was successfully created."$/) do
  assert page.has_content? "Review was successfully created."
end

When(/^I do not fill in all the fields$/) do
  fill_in('Title', :with => 'My Review')
end

Then(/^I should see "prohibited this review from being saved:"$/) do
  assert page.has_content?("prohibited this review from being saved")
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
    r.user_id = 1
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
    u.email = "user@example.com"
    u.password = "exampleuser"
    u.password_confirmation = "exampleuser"
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

Then(/^show me the page$/) do
  sleep 5
  print page.html
end

Then (/^find the school$/) do
  page.find('a', text: 'The Workshop School')
end

Given (/^I am on the new account page$/) do
  visit signup_path
end

When (/^I enter all the signup fields correctly$/) do
  fill_in('Name', :with => 'Ada Lovelace')
  fill_in('Description', :with => 'Countess of Lovelace and first programmer.')
  fill_in('Email', :with => 'lovelace@gmail.com')
  fill_in('Password', :with => 'mathandpoetryarelife')
  fill_in('Confirmation', :with => 'mathandpoetryarelife')
end

When (/^I don't enter all the signup fields correctly$/) do
  fill_in('Name', :with => 'Ada Lovelace')
  fill_in('Description', :with => 'Countess of Lovelace and first programmer.')
  fill_in('Email', :with => 'lovelace@@gmail..com')
  fill_in('Password', :with => 'mathandpoetryarelife')
  fill_in('Confirmation', :with => 'mathandpoetryarelife')
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

Given (/^There is a registered user account$/) do
  @user = User.new do |u|
    u.name = "Grace"
    u.description = "Inventor of the first programming language compiler"
    u.email = "grace@hopper.com"
    u.password = "ikillallthebugs"
    u.password_confirmation = "ikillallthebugs"
  end
  @user.save
end

And (/^I am on the login page$/) do
  visit login_path
end

When (/^I enter my email and password correctly$/) do
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
end

When (/^I enter my email incorrectly and my password correctly$/) do
  fill_in('Email', :with => 'grace@hooper.com')
  fill_in('Password', :with => @user.password)
end

When (/^I enter my email correctly and my password incorrectly$/) do
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => 'bugsbugseverywhere')
end

And (/^I hit the Log In button$/) do
  click_button('Log in')
end

And (/^I wait 3 seconds$/) do
  sleep(3)
end

Then (/^I should see my profile page$/) do
  assert page.has_content? @user.name
end

Then (/^I should see "Invalid email or password combination".$/) do
  assert page.has_content? "Invalid email"
  assert page.has_content? "password combination"
end

And (/^The user is logged in$/) do
  visit login_path
  fill_in('Email', :with => @user.email)
  fill_in('Password', :with => @user.password)
  click_button('Log in')
  sleep(3)
end

When (/^I click the 'Log out' button$/) do
  click_link('Account')
  click_link('Log out')
end

And (/^I check 'Remember me'$/) do
  check(find("input[type='checkbox']")[:session_remember_me])
end

And (/^the browser should remember my credentials$/) do
  credentials = show_me_the_cookie('remember_token')
  assert_not_nil credentials
end

And (/^I do not check 'Remember me'$/) do
end

Then (/^The browser should not remember my credentials$/) do
  credentials = show_me_the_cookie('remember_token')
  assert_not_nil credentials
end

Then (/^I should see the homepage$/) do
  assert page.has_content? "Home"
end

And (/^I should be logged out$/) do
  assert page.has_no_link? "Account"
end

When (/^I search for "New York"$/) do
  page.find('#map-input').set "New York"
end

Then (/^I should see the results$/) do
  page.has_selector?('div.pac-item span', text: 'NY, United States')
end

When (/^I search for a school$/) do
  page.find('#map-input').set "Universal Creighton Charter School"
end

Then (/^I should find the school$/) do
  page.has_selector?('div.pac-item span', text: 'Tabor Avenue, Philadelphia, PA, United States')
end

Then (/^I should see all schools in the list$/) do
  number_of_schools = School.all.size
  page.has_selector?('div.panel panel-default list-elem', :count => number_of_schools)
end

And (/^There is a preschool in the database$/) do
    @school = School.new do |s|
    s.name = "Capybara Preschool"
    s.address = "3401 Walnut Street"
    s.grade_level = "pre"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

When (/^I check 'Preschool'$/) do
  page.check 'static_pages_pre'
end

Then (/^I only see preschools in the list$/) do
  num_preschools = School.all.select {|s| s['grade_level'].downcase.include? "pre"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_preschools)
end

And (/^There is an elementary school in the database$/) do
    @school = School.new do |s|
    s.name = "Capybara Elementary"
    s.address = "3401 Walnut Street"
    s.grade_level = "elem"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

When (/^I check 'Elementary'$/) do
  page.check 'static_pages_elem'
end

Then (/^I only see elementary schools in the list$/) do
  num_elem_schools = School.all.select {|s| s['grade_level'].downcase.include? "elem"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_elem_schools)
end

And (/^There is a middle school in the database$/) do
    @school = School.new do |s|
    s.name = "Capybara Middle"
    s.address = "3401 Walnut Street"
    s.grade_level = "mid"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

When (/^I check 'Middle'$/) do
  page.check 'static_pages_mid'
end

Then (/^I only see middle schools in the list$/) do
  num_mid_schools = School.all.select {|s| s['grade_level'].downcase.include? "mid"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_mid_schools)
end

And (/^There is a high school in the database$/) do
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

When (/^I check 'High'$/) do
  page.check 'static_pages_high'
end

Then (/^I only see high schools in the list$/) do
  num_high_schools = School.all.select {|s| s['grade_level'].downcase.include? "high"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_high_schools)
end

And (/^There is an elementary-middle school in the database$/) do
  @school = School.new do |s|
    s.name = "Capybara Junior High School"
    s.address = "3401 Walnut Street"
    s.grade_level = "elem/mid"
    s.zipcode = "19104"
    s.school_type = "Public"
    s.latitude = "39.952975"
    s.longitude = "-75.191361"
  end
  @school.save
end

Then (/^I only see elementary and middle schools in the list$/) do
  num_elemmid_schools = School.all.select {|s| s['grade_level'].downcase.include? "elem" && "mid"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_elemmid_schools)
end

Then (/^I only see the elementary school in the list$/) do
  num_elem_schools = School.all.select {|s| s['grade_level'].downcase.include? "elem"}.size
  page.has_selector?('div.panel panel-default list-elem', :count => num_elem_schools)
end

# When (/^I zoom in on the map$/) do
#   current_zoom = page.evaluate_script('map.getZoom();')
#   new_zoom = current_zoom += 5
#   page.evaluate_script('map.setZoom();')
# end

# Then (/^The list should show only those schools that are within the map bounds$/) do
#   # map.getBounds().contains(marker.getPosition());
#   # num_schools = School.all.select {|s| map.getBounds().contains(s.pos); }.size
#   puts map.getBounds()
#   page.assert_selector('marker', :count => num_schools)
# end

When (/^I click 'Account'$/) do
  click_link 'Account'
end

And (/^I click 'Profile'$/) do
  click_link 'Profile'
end

And (/^I click 'Logout'$/) do
  click_link 'Log out'
end

Then (/^I should not see 'Account'$/) do
  assert page.has_no_link? 'Account'
end

And (/^I should not see 'Profile'$/) do
  assert page.has_no_link? 'Profile'
end

And (/^There are reviews of that school in the database$/) do
  @first_review = Review.new do |r|
    r.title = "Review of Capybara High School"
    r.rating = 4
    r.comment = "CHS is a pretty good school!"
    r.user_id = 1
    r.school_id = 1
  end
  @first_review.save
  @second_review = Review.new do |r|
    r.title = "Another review of Capybara High School"
    r.rating = 45
    r.comment = "CHS is a great school!"
    r.user_id = 1
    r.school_id = 1
  end
  @second_review.save
end

And (/^I am on that school's page$/) do
  visit root_path
  click_link 'Capybara High School'
  sleep(3)
end

Then (/^I can see reviews of that school on the school's page$/) do
  page.has_content? @first_review.title
  page.has_content? @second_review.title
end

And (/^There are no reviews of that school in the database$/) do
  assert_nil @first_review
  assert_nil @second_review
end

Then (/^I see a message$/) do
  page.has_content? 'There are no reviews for this school yet!'
end