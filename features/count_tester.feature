Feature: Count Tester
  I want to know if a certain text field exists

  Scenario: The field exists

  Given I am on the web page
  When txt_val_1 exists
  Then I should find true
