Feature: User has the option of making browser remember log in across sessions
  
  As a user
  So I can stay logged in after I close my browser
  I want the app to remember my login credentials
  
  Scenario: User can log in and be remembered
    Given There is a registered user account
    And I am on the login page
    And I enter my email and password correctly
    And I check 'Remember me'
    And I hit the Log In button
    And I wait 3 seconds
    Then I should see my profile page
    And the browser should remember my credentials
    
  Scenario: User can log in and not be remembered
    Given There is a registered user account
    And I am on the login page
    And I enter my email and password correctly
    And I do not check 'Remember me'
    And I hit the Log In button
    And I wait 3 seconds
    Then I should see my profile page
    And The browser should not remember my credentials