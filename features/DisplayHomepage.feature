Feature: Display homepage

  As a user
  So I can enter the app
  I want to access the homepage

  Scenario: User sees page title
    Given I am on the homepage
    Then I should see the SchoolSafe title

  Scenario: User sees page toolbar
    Given I am on the homepage
    Then I should see the toolbar option Home
    And I should see the toolbar option Log in
    And I should see the toolbar option About

  @javascript
  Scenario: User sees the map
    Given I am on the homepage
    Then I should see the map
