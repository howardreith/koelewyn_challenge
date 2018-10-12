module CountHelper
  def is_it_five(count)
    if count == 5
      "yup"
    else
      'nope'
    end
  end
end
World CountHelper

Given("the count is {int}") do |given_int|
  @count = given_int
end

When("I ask whether the count is 5") do
  @actual_answer = is_it_five(@count)
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end
