Feature: Count Tester
  I want to know if the count of spans equals 5

  Scenario: The count of spans equals 5

  Given I am on the web page
  When all 5 spans exist
  Then I should find true
