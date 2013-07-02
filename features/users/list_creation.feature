Feature: List management
  As a user
  I want to use Dunzo
  So I can create lists

  Background:
    Given I exist as a user

  @dev
  Scenario: I should already have an initial list upon sign up
    When I sign in with valid credentials
    And I visit my profile today
    Then I should have a list called "Dunzo"

  @javascript
  Scenario: I can create new lists
    When I sign in with valid credentials
    And I visit my profile today
    Then I should be able to create a new list

  Scenario: I can delete a list when I have more than 1 list
    Given I have 2 lists
    When I sign in with valid credentials
    And I visit my profile today
    Then I should be able to delete one of my lists

  Scenario: I cannot delete a list if I only have 1 list available
    When I sign in with valid credentials
    And I visit my profile today
    Then I should not be able to delete my list

  @selenium
  Scenario: I can edit a list
    When I sign in with valid credentials
    And I visit my profile today
    Then I should be able to edit my list
