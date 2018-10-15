Feature: Amazon search functionality

Scenario: searching for mobile phones on Amazon

Given a user goes to Amazon home page
When a user searches for "mobile phones"
Then amazon should return results for "mobile phones"
