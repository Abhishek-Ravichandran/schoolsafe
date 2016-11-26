Feature: User can create a review of a school
  
  As a user
  So I can comment on a school
  I want to post a review of a school
  
  Scenario: User is able to create a review when all fields are filled in
    Given There is a school in the database
    And There is a registered user account
    And The user is logged in
    And I am on the homepage
    When I click on the name of the school
    Then I should be directed to the school's page
    When I click the 'Post a Review' button
    And I wait 3 seconds
    And I should see a form to post a review
    When I fill in all the fields
    And I click Create Review
    And I wait 3 seconds
    Then I should see "Review was successfully created."
    
  Scenario: User is not able to create a review when all fields are not filled in
    Given There is a school in the database
    And There is a registered user account
    And The user is logged in
    And I am on the homepage
    When I click on the name of the school
    Then I should be directed to the school's page
    When I click the 'Post a Review' button
    And I wait 3 seconds
    And I should see a form to post a review
    When I do not fill in all the fields
    And I click Create Review
    Then I should see "prohibited this review from being saved:"
