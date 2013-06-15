Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in

    Scenario: User views home page
      When I visit the home page
      Then I should see the buttons "Log in" and "Sign Up"

    Scenario: User views login form
      When I visit the home page
      And I click a button "Log in"
      Then I should see a form with a field "Email" and "Password"

    Scenario: User signs up with valid data
      When I sign up with valid user data
      Then I should see a successful sign up message

    Scenario: User signs up with invalid email
      When I sign up with an invalid email
      Then I should see an invalid email message

