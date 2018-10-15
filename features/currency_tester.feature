Feature: Currency Tester
  I want to verify that the values on the screen are formatted as currency

  Scenario: The format of the span is currency

  Given The user is viewing the web page
  When the span's value is formatted as currency
  Then I should get a message of true
