Feature: User has a profile page when they sign up for an account
  
  As a user
  So I can see reviews of a school
  I want to see reviews listed on the school's page
  
  @javascript
  Scenario: User can see reviews on a school's page if they exists
    Given There is a school in the database
    And There is a registered user account
    And There are reviews of that school in the database
    And I am on that school's page
    Then I can see reviews of that school on the school's page

  @javascript
  Scenario: User sees a message and no reviews on a school's page if reviews don't exists
    Given There is a school in the database
    And There are no reviews of that school in the database
    And I am on that school's page
    Then I see a message