Feature: User can interact with list of schools on homepage
  
  As a user
  So I can interact with a school's listing
  I want to click through the school's name and address
  
  @javascript
  Scenario: User is directed to school page after clicking on school's name
    Given There is a school in the database
    And I am on the front page
    When I click on the name of the school
    And I wait 3 seconds
    Then I should be directed to the school's page
  
  @javascript
  Scenario: Map pans to school's pin when user clicks on school's address
    Given There is a school in the database
    And I am on the front page
    When I click on the name of the school
    Then I should see the list of crimes
    
  @javascript
  Scenario: Map pans to school's pin when user clicks on school's address
    Given There is a school in the database
    And I am on the front page
    When I click on the name of the school
    Then The map should center on that school