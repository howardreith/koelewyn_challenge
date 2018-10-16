Given(/^I am on the web page$/) do
  visit_page Site
end

When(/^all 5 spans exist$/) do
  @count = 0
  texts = []
  texts[0] = @site.value_1
  texts[1] = @site.value_2
  texts[2] = @site.value_3
  texts[3] = @site.value_4
  texts[4] = @site.value_5
  texts.each do |text|
    if text
      @count = @count + 1
    else
      @count = @count
    end
  end
end

Then(/^I should find true$/) do
  expect(@count).to eq(5)
end

Given(/^I have navigated to the web page$/) do
  visit_page Site
end

When(/^the span's value is greater than 0$/) do

  values = []
  values[0] = @site.value_1.to_s.tr('$,', '').to_f
  values[1] = @site.value_2.to_s.tr('$,', '').to_f
  values[2] = @site.value_3.to_s.tr('$,', '').to_f
  values[3] = @site.value_4.to_s.tr('$,', '').to_f
  values[4] = @site.value_5.to_s.tr('$,', '').to_f

  values.each do |value|
    if value > 0
      @value_answer = true
    else
      @value_answer = false
      break
    end
  end
end

Then(/^I should get true$/) do
  expect(@value_answer).to eq(true)
end

Given(/^The user has navigated to the web page$/) do
  visit_page Site
end

When(/^The total value is equal to the sum of the span values$/) do

  values = []
  values[0] = @site.value_1.to_s.tr('$,', '').to_f
  values[1] = @site.value_2.to_s.tr('$,', '').to_f
  values[2] = @site.value_3.to_s.tr('$,', '').to_f
  values[3] = @site.value_4.to_s.tr('$,', '').to_f
  values[4] = @site.value_5.to_s.tr('$,', '').to_f
  @sum = values.inject(0){|sum,value| sum + value }

  total = @site.total_balance.to_s.tr('$,', '').to_f

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
  visit_page Site
end

When(/^the span's value is formatted as currency$/) do
  texts = []
  texts[0] = @site.value_1
  texts[1] = @site.value_2
  texts[2] = @site.value_3
  texts[3] = @site.value_4
  texts[4] = @site.value_5
  texts[5] = @site.total_balance

  # Requires a decimal and commas
  currency_format = /^\$?(([1-9]\d{0,2}(,\d{3})*)|0)?\.\d{1,2}$/

  texts.each do |text|
    if text.match currency_format
      @currency_answer = true
    else
      @currency_answer = false
      break
    end
  end
end

Then(/^I should get a message of true$/) do
  expect(@currency_answer).to eq(true)
end
