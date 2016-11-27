Feature: Validate review constraints
  
  As a user
  So I can add reviews to the database
  I want the review fields to be validated
  
  Scenario: User can add review of school when all fields pass validation
    Given I am on the homepage
    And There is a registered user account
    And There is a school in the database
    When I enter all the fields of the review
    Then I should be able to save it to the database
    
  Scenario: User cannot add review when at least one field fails validation
    Given I am on the homepage
    When I enter at least one incorrect field
    Then I should not be able to save it to the database

    