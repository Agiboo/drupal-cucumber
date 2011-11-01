@drupal_core @user
Feature: Testing user module

  Scenario: Ensure a user can log in
    When I fill in the login form and I submit it
    Then I am logged in

  Scenario: Ensure a user can properly log in
    Given I'm logged in as an authenticated user
    Then I can see my history

  Scenario: Ensure a user can edit his details
    Given I'm logged in as an authenticated user
    When I change my e-mail address
    Then my e-mail address has changed