Feature: Value_verifier
  I want to verify that the value of txt_val_1 is greater than 0

  Given txt_val_1 is greater than 0
  When I ask whether txt_val_1 is greater than 0
  Then I should be told "yup"
