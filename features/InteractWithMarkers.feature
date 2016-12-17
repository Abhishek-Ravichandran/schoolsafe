Feature: The link to the school pops up when mouseover marker on map
  
  As a user
  So I get the link to school page with school markers
  I want to mouseover the marker and see the link
  
  @javascript
  Scenario: User click the marker on the maps
    Given There are two schools in the database
    And I am on the front page
    When I hover over the marker
    Then the link to the school should pop up