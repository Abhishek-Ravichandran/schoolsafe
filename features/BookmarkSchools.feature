Feature: User can bookmark schools
  
  As a user
  So I can keep track of my favorite schools
  I want to bookmark schools
  
  @javascript
  Scenario: User can add a school to their favorites
    Given There is a registered user account
    And The user is logged in
    And There is a school in the database
    And I am on that school's page
    When I click Bookmark
    And I navigate to my profile page
    Then I should see the name of that school in my list of bookmarks
    
  @javascript  
  Scenario: User can remove a school from their bookmarks
    Given There is a registered user account
    And The user is logged in
    And There is a school in the database
    And That school is in the user's favorites
    And I am on that school's page
    When I click Remove Bookmark
    And I navigate to my profile page
    Then I should not see the name of that school in my list of bookmarks
    
  @javascript
  Scenario: User cannot bookmark a school if they are not logged in
    Given There is a registered user account
    And There is a school in the database
    And I am on that school's page
    Then I should not see a Bookmark button
    