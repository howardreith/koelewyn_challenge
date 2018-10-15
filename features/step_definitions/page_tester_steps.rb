Given(/^I am on the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^all 5 spans exist$/) do
  @count = 0
  texts = []
  texts[0] = @browser.span id: 'txt_val_1'
  texts[1] = @browser.span id: 'txt_val_2'
  texts[2] = @browser.span id: 'txt_val_4'
  texts[3] = @browser.span id: 'txt_val_5'
  texts[4] = @browser.span id: 'txt_val_6'
  texts.each do |text|
    if text.exists?
      @count = @count + 1
    end
  end
end

Then(/^I should find true$/) do
  expect(@count).to eq(5)
end

Given(/^I have navigated to the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^the span's value is greater than 0$/) do
  element1 = @browser.span id: 'txt_val_1'
  puts(element1)
  value1 = element1.text.to_s.tr('$,', '')
  value1 = value1.to_f
  puts(value1)
  if value1 > 0
    @answer = true
  end
  puts @answer
end

Then(/^I should get true$/) do
  expect(@answer).to eq(true)
end
