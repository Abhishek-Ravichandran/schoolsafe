Feature: Validate user constraints
  
  As a user
  So I can create a user account
  I want the user fields to be validated
  
  Scenario: User can register when all fields pass validation
    Given I am on the homepage
    When I enter all the registration fields correctly
    Then I should be able to register an account
    
  Scenario: User cannot add review when at least one field fails validation
    Given I am on the homepage
    When I enter at least one incorrect registration field
    Then I should not be able to register an account