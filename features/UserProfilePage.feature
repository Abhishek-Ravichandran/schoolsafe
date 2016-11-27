Feature: User has a profile page when they sign up for an account
  As a user
  So I can see information about my account
  I want a profile page
  
  Scenario: A user can see their profile page when they log in
    Given There is a registered user account
    And I am on the login page
    When I enter my email and password correctly
    And I hit the Log In button
    And I wait 3 seconds
    Then I should see my profile page
    
  Scenario: A user can access their profile page whenever they're logged in
    Given There is a registered user account
    And The user is logged in
    And I am on the homepage
    When I click 'Account'
    And I click 'Profile'
    And I wait 3 seconds
    Then I should see my profile page
    
  Scenario: A user who is not logged in does not have a profile page
    Given There is a registered user account
    And The user is logged in
    When I click 'Account'
    And I click 'Logout'
    And I wait 3 seconds
    Then I should not see 'Account'
    And I should not see 'Profile'
    
    

    