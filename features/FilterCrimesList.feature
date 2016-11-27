Feature: User can interact with list of crimes on the school page
  
  As a user
  I want to interact with the list of crimes
  So I can filter the crimes according to crime types, years and radius
  
  @javascript
  Scenario: Map pans to school's pin when user clicks on school's address
    Given There is a school in the database
    And I am on the front page
    When I click on the name of the school
    Then I should see the list of crimes