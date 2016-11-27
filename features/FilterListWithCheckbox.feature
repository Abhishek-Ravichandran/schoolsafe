Feature: User can filter the list of schools using the checkboxes
  
  As a user
  So I can filter schools by grade level
  I want to click the checkbox options
  
  @javascript
  Scenario: User clicks no checkboxes and list does not filter
    Given There is a school in the database
    And I am on the front page
    Then I should see all schools in the list and map
  
  @javascript
  Scenario: User clicks Preschool checkbox and the list filters
    Given I am on the homepage
    And There is a preschool in the database
    When I check 'Preschool'
    And I wait 3 seconds
    Then I only see preschools in the list and map
  
  @javascript 
  Scenario: User clicks Elementary checkbox and the list filters
    Given I am on the homepage
    And There is an elementary school in the database
    When I check 'Elementary'
    And I wait 3 seconds
    Then I only see elementary schools in the list and map
  
  @javascript 
  Scenario: User clicks Middle checkbox and the list filters
    Given I am on the homepage
    And There is a middle school in the database
    When I check 'Middle'
    And I wait 3 seconds
    Then I only see middle schools in the list and map
  
  @javascript  
  Scenario: User clicks High checkbox and the list filters
    Given I am on the homepage
    And There is a high school in the database
    When I check 'High'
    And I wait 3 seconds
    Then I only see high schools in the list and map
  
  @javascript 
  Scenario: User clicks Elementary checkbox and Middle checkbox and the list filters
    Given I am on the homepage
    And There is an elementary-middle school in the database
    When I check 'Elementary'
    And I check 'Middle'
    And I wait 3 seconds
    Then I only see elementary and middle schools in the list and map