Feature: User can interact with list of crimes on the school page
  
  As a user
  I want to interact with the list of crimes
  So I can filter the crimes according to crime types, years and radius
  
  @javascript
  Scenario: filter the crimes with crime types
    Given I am on the homepage
    And There is a school in the database
    And I am on the school page
    When I select "Aggravated Assault"
    Then only Assault crimes appear in the list and map
    
  @javascript
  Scenario: filter the crimes with past years
    Given I am on the homepage
    And There is a school in the database
    And I am on the school page
    When I select "past 1 year"
    Then only the crimes within 1 year appear in the list and map
    
  @javascript
  Scenario: filter the crimes with radius
    Given I am on the homepage
    And There is a school in the database
    And I am on the school page
    When I select "100m"
    Then only the crimes within 100m appear in the list and map