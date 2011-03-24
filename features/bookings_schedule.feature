Feature: Bookings schedule
  In order to schedule working hours
  As a staff member
  I can view the bookings that are scheduled day by day

 Background: Children are registered
   Given these children are registered
     |first name|last name|
     |George    |Orwell   |
     |Bill      |Davis    |
     |Roger     |Rabbit   |

 Scenario: Staff member consults today's schedule and sees the bookings for the day
   Given the following bookings
     |name  |date      |period|
     |George|2010-12-01|am    |
     |George|2010-12-01|pm    |
     |Bill  |2010-12-01|am    |
     |Roger |2010-12-02|am    |
   And today is 2010-12-01
   When I consult today's schedule
   Then the am schedule is
     |name         |
     |George Orwell|
     |Bill Davis   |
   And today's pm schedule is
     |name         |
     |George Orwell|