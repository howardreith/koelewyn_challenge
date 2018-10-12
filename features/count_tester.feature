Feature: Count_tester
  I want to know if the count of items is equal to 5.

  Scenario: The count is not equal to 5

  Given the count is 4
  When I ask whether the count is 5
  Then I should be told "nope"

  Scenario: The count is equal to 5

  Given the count is 5
  When I ask whether the count is 5
  Then I should be told "yup"
