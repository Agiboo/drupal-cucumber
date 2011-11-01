@drupal_core @node
Feature: Testing node module

  Scenario: Ensure a user can create a node of type page
    Given I'm logged in as an administrator
    When I create a new page
    Then that new node is created

  Scenario: Ensure a newly created node is published on the front page
    Given I'm logged in as an administrator
    When I create a new page that's promoted to the front page
    Then I can see that new page on the front page

  Scenario: Ensure a page is editable
    Given I'm logged in as an administrator
    When I create a new page and unpublish it
    Then I can't see that page anymore