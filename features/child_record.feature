Feature: Child record
  In order to print a record
  As a staff member
  I can consult a child personal information

  Background: Child is registered
    Given a child registered with:
      | first name    | George                                  |
      | last name     | Orwell                                  |
      | birth date    | 2007-03-23                              |
      | snack         | no                                      |
      | bottle        | yes                                     |
      | nap           | yes                                     |
      | allergies     | peanuts                                 |
      | public notes  | Frequently puts forks in electric plugs |
      | private notes | Father can't approach                   |

  Scenario: Staff member consults a child record and sees the child's personal information
    When I consult "George" "Orwell"'s file
    And I see that his name is "George" "Orwell"
    And I see that his birth date is "23 March 2007"
    And I see that he does not expect a snack
    And I see that he expects a bottle
    And I see that he needs a nap
    And I see that he is allergic to "peanuts"
    And I see the following notes:
      | public                                  | private               |
      | Frequently puts forks in electric plugs | Father can't approach |



