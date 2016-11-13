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

When (/^I click on the name of the school$/) do
  # res = page.find("a", text: "Henry, Charles W.")
  # res = page.find(:xpath, '//*[@id="list"]/div[2]/div[1]/a')
  wait_until { page.find(:xpath, '//*[@id="list"]/div[2]/div[1]/a').visible? }
  res = page.find("div#list")
  print res
  # click_link(res)
end

Then (/^I should be directed to the school's page$/) do
  # assert page.find(:xpath, '/html/body/div/div/h1').has_content?('Henry, Charles W.')
  page.find("h1", )
end

When (/^I select a grade level$/) do
  # res = page.find("input[id='elem']")
  # res.set(true)
  # page.find_by_id("elem").set(true)
  check('Elementary')
end

And (/^I click Submit$/) do
  click_button("Submit")
end

Then (/^I should see a list of schools for that grade level$/) do
  # res = page.find_all(:css, 'div.panel')
  # # print res.length
  # res = res.find_all('div')
  # res.each { |r|
  #   print r.text
  #   puts
  # }
  # res = page.find_all("p", :text => /^[a-zA-Z\/]*Elem[a-zA-Z]*/)
  # res = page.find_all("p")
  # res = page.all(:xpath, 'a')
  # res = page.all('.div > p:nth-child(2)', text: 'Elem/Middle')
  # page.assert_selector('div#list > div', count: 1)
  print res.length
  # print School.all.select { |x| x.grade_level.downcase.include? "elem" if x.grade_level}.length
  # assert_equal res.length, School.all.select { |x| x.grade_level.downcase.include? "elem" if x.grade_level}.length
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

