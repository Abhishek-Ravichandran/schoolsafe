Feature: User can sign up for an account
  
  As a user
  So I can post reviews of schools
  I want to create an account
  
  Scenario: User can register when they fill all fields in registration form
    Given I am on the new account page
    When I enter all the signup fields correctly
    And I click the Submit button
    Then I should be able to create an account
    
  Scenario: User can't register when they don't fill all fields in registration form
    Given I am on the new account page
    When I don't enter all the signup fields correctly
    And I click the Submit button
    Then I should see an error on the page
