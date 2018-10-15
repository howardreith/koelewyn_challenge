Given(/^I am on the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^txt_val_1 exists$/) do
  @count = 0
  text1 = @browser.span id: 'txt_val_1'
  if text1.exists?
    @count = @count + 1
    puts(@count)
  end
end

Then(/^I should find true$/) do
  expect(@count).to eq(1)
end
