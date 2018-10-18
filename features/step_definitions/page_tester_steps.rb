Given(/^the user opens the web page$/) do
  visit_page Site
end

When(/^we count the spans$/) do
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

Then(/^we should find 5 spans$/) do
  expect(@count).to eq(5)
end

When(/^we look at the values of the spans$/) do

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

Then(/^the values should all be greater than 0$/) do
  expect(@value_answer).to eq(true)
end

When(/^we check the formatting of the spans$/) do
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

Then(/^they should all be formatted as currency$/) do
  expect(@currency_answer).to eq(true)
end

When(/^we check the total value displayed$/) do

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

Then(/^it should be equal to the sum of the spans$/) do
  expect(@total_answer).to eq(true)
end
