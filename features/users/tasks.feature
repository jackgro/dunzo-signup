Feature: Task creation
  In order to use Dunzo
  As a user
  I need to be able to create tasks

  Background:
    Given I exist as a user
    And I sign in with valid credentials

  @javascript
  Scenario: I can create a new task for a list
    When I visit my profile today
    And I create a new list
    Then I should be able to create a new task for my list

  @selenium
  Scenario: I can delete a task on a list
    When I visit my profile today
    Then I should be able to delete a task for my list

  @javascript
  Scenario: I can mark a task as complete
    When I visit my profile today
    And I create a new list
    And I create a new task for my list
    Then I should be able to mark the task as complete

  @javascript
  Scenario: I can mark a complete task as incomplete
    Given I have a list with a complete task
    When I visit the page for my list
    Then I should be able to mark the task as incomplete
