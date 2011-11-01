@drupal_core @user
Feature: Testing user access

  Scenario: Ensure a login screen is available.
    When I visit the login page
    Then I see the login form

  Scenario: Ensure I can change my details.
    Given I'm logged in as an administrator
    When I change my profile details
    Then the profile changes are in effect

  Scenario: Ensure I can navigate through the website.
    Given I'm logged in as an administrator
    Then I can navigate through the site