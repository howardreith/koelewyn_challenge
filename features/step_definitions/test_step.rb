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

Given("the count is 4") do
  @count = 4
end

When("I ask whether the count is 5") do
  @actual_answer = is_it_five(@count)
end

Then("I should be told {string}") do |expected_answer|
  expect(@actual_answer).to eq(expected_answer)
end

Given("the count is 5") do
  @count = 5
end
