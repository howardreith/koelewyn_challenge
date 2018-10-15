Feature: Total Tester
  I want to verify that the total listed on the screen is, in fact, the total
  of the other spans.

  Scenario: The value of the total is the correct total of the figures

  Given The user has navigated to the web page
  When The total value is equal to the sum of the span values
  Then I should see a return of true
