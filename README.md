# Response to Problem #1
### By Howie Reith

The solution in this repository provides 4 tests for Problem #1:

#### count_tester
Verifies that there are 5 values on the screen.

#### value_tester
Verifies that these five values are all greater than 0.

#### total_tester
Verifies that the value in txt_ttl_val is equal to the sum of the five values displayed.

#### currency_tester
Verifies that all 6 values, including the total, are formatted as currencies.

## Notes

- I have included only 4 tests because the third and fifth objectives were redundant.
- The txt_val IDs skip txt_val_3. This has been reflected in the page object model.
- I have assumed that the values displayed are in span elements.
- For the currency evaluation, I have required a decimal point, commas, and I have limited the cents to two digits. I have not required a $ symbol as that would preclude working with non-USD currencies.

In order to make sure my tests function, I created a page to run on a localhost server. That material can be accessed in the following repo:
https://github.com/howardreith/cucumberhelper

To use this material, perform the following:

1. Clone the repository
2. In the directory, install dependencies with "npm install"
3. In your terminal, type "grunt serve."
4. Navigate to localhost:7165. You should see the values as displayed in the challenge image.
5. In your local koelewyn_challenge repo, navigate to features/support/page.rb
6. Comment out "page_url("https://www.exercise1.com/values")" and comment in "page_url("http://localhost:7165/")
7. Save
8. Run tests

If you have any questions please feel free to contact me at howard.reith@gmail.com. Thank you.
