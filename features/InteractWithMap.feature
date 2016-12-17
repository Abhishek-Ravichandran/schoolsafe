Feature: User can filter the list of schools by adjusting the map
  
  As a user
  So I can filter schools by area
  I want to position the map and see the list filter
  
  @javascript
  Scenario: User does not update the map and the list does not filter
    Given There are two schools in the database
    And I am on the front page
    Then I should see two schools in the list

  @javascript
  Scenario: User zooms in on the map and the list filters
    Given There are two schools in the database
    And I am on the front page
    When I zoom in
    Then I only see one school in the list