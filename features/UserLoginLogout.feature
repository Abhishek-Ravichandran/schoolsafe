Feature: User can log in and log out of account
  
  As a user
  So I can control access to my account
  I want to log in and log out of my account
  
  Scenario: User can log in by entering correct email and password
    Given There is a registered user account
    And I am on the login page
    When I enter my email and password correctly
    And I hit the Log In button
    And I wait 3 seconds
    Then I should see my profile page

  Scenario: User can't log in by entering incorrect email and correct password
    Given There is a registered user account
    And I am on the login page
    When I enter my email incorrectly and my password correctly
    And I hit the Log In button
    Then I should see "Invalid email or password combination".
    
  Scenario: User can't log in by entering correct email and incorrect password
    Given There is a registered user account
    And I am on the login page
    When I enter my email correctly and my password incorrectly
    And I hit the Log In button
    Then I should see "Invalid email or password combination".
    
  Scenario: Once logged in, user can log out
    Given There is a registered user account
    And The user is logged in
    When I click the 'Log out' button
    And I wait 3 seconds
    Then I should see the homepage
    And I should be logged out
    

