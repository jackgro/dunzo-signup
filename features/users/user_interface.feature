Feature: Basic UI Features
  As a user
  I want to sign into my account
  So I can create lists

  Scenario: Basic UI
    Given I exist as a user
    When I sign in with valid credentials
    And I visit my profile
    Then I should see the standard UI
