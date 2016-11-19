Feature: User can create a review of a school
  
  As a user
  So I can comment on a school
  I want to post a review of a school
  
  Scenario: User is able to create a review when all fields are filled in
    Given There is a school in the database
    And I am on the new review form page
    When I fill in all the fields
    And I click Create Review
    Then I should see "Review was successfully created."
    
  Scenario: User is not able to create a review when all fields are not filled in
    Given There is a school in the database
    And I am on the new review form page
    When I do not fill in all the fields
    And I click Create Review
    Then I should see "3 errors prohibited this review from being saved:"
