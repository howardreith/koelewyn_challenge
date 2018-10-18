Feature: Count Tester
  I want to know if the right number of spans appear, that they have values
  greater than 0, that they're formatted as currency, and that the total
  displayed on screen is the sum of the displayed values.

  Scenario: The user has navigated to the site and is observing the values.

  Given the user opens the web page
  When we count the spans
  Then we should find 5 spans
  When we look at the values of the spans
  Then the values should all be greater than 0
  When we check the formatting of the spans
  Then they should all be formatted as currency
  When we check the total value displayed
  Then it should be equal to the sum of the spans
