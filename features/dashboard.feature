@javascript

  Feature: Dashboard

    Background: User Authenticates
      Given There is an account with login "thanh"
      Given I log in as "thanh"

    Scenario: test dashboard page
      When I visit the dashboard page
      Then I see the dashboard title
