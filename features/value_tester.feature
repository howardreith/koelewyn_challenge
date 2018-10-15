Feature: Value Tester
  I want to verify that the values on the screen are greater than 0

  Scenario: The value of the span is greater than 0

  Given I have navigated to the web page
  When the span's value is greater than 0
  Then I should get true
