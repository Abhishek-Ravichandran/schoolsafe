Feature: User can filter the list of schools using the checkboxes
  
  As a user
  So I can filter schools by grade level
  I want to click the checkbox options
  
  Scenario: User clicks no checkboxes and list does not filter
    Given I am on the homepage
    When I press the Submit button
    Then I should see all schools