Feature: Validate school constraints
  
  As a user
  So I can rely on a clean database
  I want the school fields to be validated
  
  Scenario: School is saved into the database when all fields pass validation
    Given I am on the root page
    When I enter all the school fields correctly
    Then I should be able to create a new school
    
  Scenario: School is not saved into the database when at least one field fails validation
    Given I am on the root page
    When I enter at least one incorrect school field
    Then I should not be able to create a new school