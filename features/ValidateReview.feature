Feature: Validate review constraints
  
  As a user
  So I can add reviews to the database
  I want the review fields to be validated
  
  Scenario: User can add review when all fields pass validation
    Given I am on the main page
    When I enter all the fields of the review
    Then I should be able to save it to the database
    
  Scenario: User cannot add review when at least one field fails validation
    Given I am on the homepage
    When I enter at least one incorrect field
    Then I should not be able to save it to the database
    
  Scenario: User can attach a review to a school
    Given I am on the homepage
    When I add a review for a particular school
    Then I should be able to access that review through the school
    