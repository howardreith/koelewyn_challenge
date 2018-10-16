require 'watir'
require 'page-object'

class Site
  include PageObject

  # page_url("https://www.exercise1.com/values")
  page_url("http://localhost:7165/")

  span(:value_1, id: "txt_val_1")
  span(:value_2, id: "txt_val_2")
  span(:value_3, id: "txt_val_4")
  span(:value_4, id: "txt_val_5")
  span(:value_5, id: "txt_val_6")
  span(:total_balance, id: "txt_ttl_val")

  @browser = Watir::Browser.new :chrome

end
