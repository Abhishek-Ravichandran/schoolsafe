Feature: Display a list of schools
  
  As a user
  So I can browse schools by name
  I want to see a list of schools
  
  Scenario: User sees list
    Given I am on the homepage
    Then I should see a list of schools
  
  Scenario: User can filter by grade level
    Given I am on the homepage
    When I select a grade level
    And I click Submit
    Then I should see a list of schools for that grade level
  
  # Scenario: User can search for specific school that exists
  #   Given I am on the homepage
  #   When I search for a school that exists
  #   Then I should see only that school displayed in the list
  
  # Scenario: User can search for specific school that does not exist
  #   Given I am on the homepage
  #   When I search for a school that does not exist
  #   Then I should not see any schools in the list
    
  # Scenario: User can search by address
  #   Given I am on the homepage
  #   When I search by address
  #   Then I should see schools near that address in the list
    