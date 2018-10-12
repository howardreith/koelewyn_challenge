Feature: Count_tester
  I want to know if the count of items is equal to 5.

  Scenario Outline: The count is or is not equal to 5

  Given the count is <count>
  When I ask whether the count is 5
  Then I should be told <answer>

  Examples:
    | count | answer |
    | 4 | "nope" |
    | 5 | "yup" |
    | 1000 | "nope" |
