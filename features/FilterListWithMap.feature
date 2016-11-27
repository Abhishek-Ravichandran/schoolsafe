Feature: User can filter the list of schools by adjusting the map
  
  As a user
  So I can filter schools by area
  I want to position the map and see the list filter
  
  Scenario: User does not update the map and the list does not filter
    Given I am on the homepage
    Then I should see all schools in the list

  @javascript
  Scenario: User zooms in on the map and the list filters
    Given I am on the homepage
    When I zoom in on the map
    Then The list should show only those schools that are within the map bounds