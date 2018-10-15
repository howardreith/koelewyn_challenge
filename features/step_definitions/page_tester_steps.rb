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
  texts = []
  texts[0] = @browser.span id: 'txt_val_1'
  texts[1] = @browser.span id: 'txt_val_2'
  texts[2] = @browser.span id: 'txt_val_4'
  texts[3] = @browser.span id: 'txt_val_5'
  texts[4] = @browser.span id: 'txt_val_6'

  values = []
  values[0] = texts[0].text.to_s.tr('$,', '').to_f
  values[1] = texts[1].text.to_s.tr('$,', '').to_f
  values[2] = texts[2].text.to_s.tr('$,', '').to_f
  values[3] = texts[3].text.to_s.tr('$,', '').to_f
  values[4] = texts[4].text.to_s.tr('$,', '').to_f

  values.each do |value|
    if value > 0
      @value_answer = true
    else
      @value_answer = false
    end
  end
end

Then(/^I should get true$/) do
  expect(@value_answer).to eq(true)
end

Given(/^The user has navigated to the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^The total value is equal to the sum of the span values$/) do
  texts = []
  texts[0] = @browser.span id: 'txt_val_1'
  texts[1] = @browser.span id: 'txt_val_2'
  texts[2] = @browser.span id: 'txt_val_4'
  texts[3] = @browser.span id: 'txt_val_5'
  texts[4] = @browser.span id: 'txt_val_6'

  values = []
  values[0] = texts[0].text.to_s.tr('$,', '').to_f
  values[1] = texts[1].text.to_s.tr('$,', '').to_f
  values[2] = texts[2].text.to_s.tr('$,', '').to_f
  values[3] = texts[3].text.to_s.tr('$,', '').to_f
  values[4] = texts[4].text.to_s.tr('$,', '').to_f
  @sum = values.inject(0){|sum,value| sum + value }

  total_text = @browser.span id: 'txt_ttl_val'
  total = total_text.text.to_s.tr('$,', '').to_f

  if @sum == total
    @total_answer = true
  else
    @total_answer = false
  end
end

Then(/^I should see a return of true$/) do
  expect(@total_answer).to eq(true)
end

Given(/^The user is viewing the web page$/) do
  @browser.goto('http://localhost:7165/')
end

When(/^the span's value is formatted as currency$/) do
  spans = []
  spans[0] = @browser.span id: 'txt_val_1'
  spans[1] = @browser.span id: 'txt_val_2'
  spans[2] = @browser.span id: 'txt_val_4'
  spans[3] = @browser.span id: 'txt_val_5'
  spans[4] = @browser.span id: 'txt_val_6'
  spans[5] = @browser.span id: 'txt_ttl_val'
  puts spans

  texts = []
  texts[0] = spans[0].text
  texts[1] = spans[1].text
  texts[2] = spans[2].text
  texts[3] = spans[3].text
  texts[4] = spans[4].text
  texts[5] = spans[5].text
  puts texts

  # Requires a decimal and commas
  currency_format = /^\$?(([1-9]\d{0,2}(,\d{3})*)|0)?\.\d{1,2}$/

  if texts[0].match currency_format
    @currency_answer = true
    puts @currency_answer
  else
    @currency_answer = false
    puts @currency_answer
  end

end

Then(/^I should get a message of true$/) do
  expect(@currency_answer).to eq(true)
end
