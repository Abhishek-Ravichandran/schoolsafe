Feature: Google Maps Search-box
  
  As a user
  I want to use the search-box
  So I can search for places
  
  @javascript
  Scenario: User search for 'New York'
    Given I am on the homepage
    When I search for "New York"
    Then I should see the results
  
  @javascript
  Scenario: User search for a school
    Given I am on the homepage
    When I search for a school
    Then I should find the school