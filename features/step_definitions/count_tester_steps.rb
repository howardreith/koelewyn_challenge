Given(/^I am on the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^txt_val_1 exists$/) do
  text1 = @browser.span id: 'txt_val_1'
  @answer = text1.exists?
  puts(@answer)
end

Then(/^I should find true$/) do
  expect(@answer).to eq(true)
end
