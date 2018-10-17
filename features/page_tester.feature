Feature: Count Tester
  I want to know if the right number of spans appear, that they have values
  greater than 0, that they're formatted as currency, and that the total
  displayed on screen is the correct total.

  Scenario: The user has navigated to the site and is observing the values.

  Given the user opens the web page
  When all 5 spans exist
  And all of the spans' values are greater than 0
  And all of the spans are formatted as currency
  And the total value is equal to the sum of the span values
  Then it's all good
