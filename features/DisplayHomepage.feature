Feature: Display Homepage
  
  As a user
  So I can enter the application
  I want to access the homepage
  
  Scenario: User sees app logo
    Given I am on the homepage
    Then I should see the 'SchoolSafe' logo

  Scenario: User sees page toolbar
    Given I am on the homepage
    Then I should see the toolbar option 'Home'
        And I should see the toolbar option 'Log in'
        And I should see the toolbar option 'About'
  
  Scenario: User sees map
    Given I am on the homepage
    Then I should see the map
  
  Scenario: User sees list
    Given I am on the homepage
    Then I should see a list of schools
    
  Scenario: User sees search bar
    Given I am on the homepage
    Then I should see a search bar
    
  Scenario: User can navigate to the 'About' page
    Given I am on the homepage
    When I click the 'About' link
    Then I should see the 'About' page
        