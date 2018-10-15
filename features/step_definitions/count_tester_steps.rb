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
