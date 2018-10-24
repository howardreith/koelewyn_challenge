# Response to Problem #1
### By Howie Reith

The solution in this repository provides 4 tests for Problem #1 as presented here:

![alt text](https://raw.githubusercontent.com/howardreith/koelewyn_challenge/master/Jason%20Koelewyn%20Challenge.png)

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

## Update 10/24/2018

Since my previous update on 10/18, I have incorporated the following changes:

### Page Object Model Improvement

In my previous version I increased specificity for my page object model by including both IDs and "text" in
my identification. I have decided to remove "text" as having fewer, but more robust, identifiers will serve
to make my tests adequately accurate but also flexible in case the values of the spans change. In other words,
relying only on ID is sufficient for now, and this change will make my tests less likely to break with page
updates.

### Segregating the scenarios

In my previous version, I had an erroneous understanding of what constituted a "test." I thought each "step"
was a "test," and sought to reduce the total number of "tests" by consolidating them all into a single
feature and scenario. I have since learned that each scenario constitutes a "test" and I should not sacrifice
specificity of scenario for the sake of reducing the number of "tests."

I've thus continued to keep all of my scenarios in a single feature, but I have split my steps into four
scenarios to cover the four issues we're hoping to address in the challenge. The resulting specificity of
each test is a definite improvement. Unlike the original version, when possible, I have made repeated
use of similar steps, such as using the same "Given" to open the browser in all four scenarios, thus reducing
the defined number of steps and de-cluttering my code compared to my original version.

I will note that this new design requires the test procedures to open the browser four separate times, which seems
somewhat less than ideal, but perhaps this is how it should remain for the sake of completely testing each
individual problem. For reference, the scenarios in the feature file now appear as follows:

  Scenario: Verify there is the proper number of spans.

  Given the user opens the web page
  
  When we count the spans
  
  Then we should find 5 spans

  Scenario: Verify the values of the spans are all greater than 0

  Given the user opens the web page
  
  When we look at the values of the spans
  
  Then the values should all be greater than 0

  Scenario: Verify that the spans are formatted as currency.

  Given the user opens the web page
  
  When we check the formatting of the spans
  
  Then they should all be formatted as currency

  Scenario: Verify the displayed total equals the sum of the displayed values.

  Given the user opens the web page
  
  When we check the total value displayed
  
  Then it should be equal to the sum of the spans

### Accomodating additional values being added to the page and removing hard-coded span identification

The most significant change to my response involves altering the procedure for the test to count the number
of value spans on the page. In the previous version, the test referenced the Page Object Model to check if
each of the five known span IDs were present. If the span was there, it added +1 to a counter, and the test
passed if the counter totaled 5, i.e., it found all five expected spans.

While this solution technically met the criteria, it had some weaknesses, not least being that if there were
more spans than just those expected by the test (for example, a span labeled txt_val_9), it would fail to
identify that span.

The test has thus been changed to find all spans on the page. Since this results in finding the label spans and
the total span as well as the value spans, a conditional has been added to reference the page object model and
add to an array only those spans which have ids that match the criteria we're looking for. In this version,
that meant a "t" in the first character and a "v" in the 5th character, as this is sufficient to rule out all
other spans currently present. These restrictions can be made more robust if necessary. Those spans which fit
the requirement are added to an array, and the previous solution of increasing a counter for each item
in the array was repeated. If the array contains the expected 5 values, the test passes.

This change will minimize the necessary adjustments to the test should additional spans be added to future versions
of the page.

## Update 10/18/2018

I have implemented some changes into the design of the test. Following are the details of these changes.

### Page Object Model Improvement

In hopes of making the page object model more robust should the page change in the future, I sought to add
as many values to characterize the spans as possible. According to this site:
https://github.com/cheezy/page-object/wiki/Elements
the options are class, id, index, name, text, and xpath. Since the only information I have access to via this
challenge involves the id and text, I included those, but could not include anything further without making
things up. I have thus left it as those two values but acknowledge on a real site more values would likely
be available for use.

### Reducing the number of steps

I have consolidated my four feature files into a single feature so as to reuse the initial "Given" rather than
using several with slightly altered wording.

In my initial refactoring effort, I also sought to consolidate all of the "Then"s into a single "Then." 
My .feature file thus looked like:
Given the user is on the site
When the count of spans is 5
And the values are greater than 0
And the spans are formatted as currency
And the total displayed equals the sum of the spans
Then it's all good

While this significantly reduced the number of steps, I disliked this solution as it failed to isolate the cause of
a failure in the event a failure occurs. The only failing line would be "Then it's all good," which is ambiguous
and nearly defeats the purpose of automated testing altogether.

I thus concluded that having a "then" following each "when" provided for a more useful and robust test, and though
it meant more steps, those steps appear to be necessary.

### Improving test names

In the previous version the "when" test names included the condition we were trying to meet. For example,
"When the values are greater than 0," and then the "then" statement would simply say "then it's good," or
something along those lines.

I found these names to be misleading as they do not accurately reflect the point of failure in the testing process.
"When the values are greater than 0" would appear to pass even though the values were not greater than 0 simply
because the test successfully analyzed the values (which was the true condition for success in that step).

I have thus rearranged the tests as follows:

  Given the user opens the web page
  When we count the spans
  Then we should find 5 spans
  When we look at the values of the spans
  Then the values should all be greater than 0
  When we check the formatting of the spans
  Then they should all be formatted as currency
  When we check the total value displayed
  Then it should be equal to the sum of the spans

When a test fails at the "then" stage it is thus obvious that it failed, for example, because there were not 5 spans,
not simply because it was "not good."

### On analyzing values and counting spans

It occurred to me that, so long as we are able to successfully determine if a span's value is greater than 0,
this implicitly determines whether the span existed, thus potentially rendering the first test counting the spans
obsolete, or at least, one which can be easily implemented in the second step.

I decided to keep them separate for two reasons.

First, the challenge specifically requests them as separate elements, and I did not see them as obviously redundant
as was the case with the "total" test.

Second, by keeping them separate tests it helps elucidate the problem. If the "value" test fails, was it because
the span didn't exist or because the values were not greater than 0? Keeping them as separate steps solves this
ambiguity.

## Success Mockup

A successful run of tests should appear as follows:

$ cucumber
Feature: Count Tester
  I want to know if the right number of spans appear, that they have values
  greater than 0, that they're formatted as currency, and that the total
  displayed on screen is the sum of the displayed values.

  Scenario: The user has navigated to the site and is observing the values. # features/page_tester.feature:6
    
    Given the user opens the web page 
    
    When we count the spans
    
    Then we should find 5 spans
    
    When we look at the values of the spans
    
    Then the values should all be greater than 0
    
    When we check the formatting of the spans
   
    Then they should all be formatted as currency
   
    When we check the total value displayed
   
    Then it should be equal to the sum of the spans

1 scenario (1 passed)

9 steps (9 passed)

0m1.930s
