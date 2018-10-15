Given(/^a user goes to Amazon home page$/) do
  @browser.goto("http://www.amazon.com")
end

When(/^a user searches for "([^"]*)"$/) do |arg|
  @browser.text_field(:id => "twotabsearchtextbox").wait_until_present
  @browser.text_field(:id => "twotabsearchtextbox").set "#{arg}"
  @browser.send_keys :return
end

Then(/^amazon should return results for "([^"]*)"$/) do |arg|
  @browser.link(:id => "bcKwText").wait_until_present
  page_output = @browser.link(:id => "bcKwText").text.include? "#{arg}"
  expect(page_output).to eql(true)
  @browser.close
end
