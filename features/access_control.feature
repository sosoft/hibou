Feature: Access control
  In order to prevent unauthorized access
  As the daycare manager
  I want staff members to authenticate before using the application

  Scenario: Staff member provides valid credentials and is granted access
    Given I am registered as "vincent@gmail.com" with password "a secret"
    And I am not authenticated
    When I login as "vincent@gmail.com" using password "a secret"
    Then I am granted access

  Scenario: Hacker is prevented from creating an account
    Given I am not authenticated
    When I try to register
    Then I am denied access