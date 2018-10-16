require 'watir'
require 'page-object'

class Site
  include PageObject

  # page_url("https://www.exercise1.com/values")
  page_url("http://localhost:7165/")

  span(:value_1, id: "txt_val_1", text: "$122,365.24")
  span(:value_2, id: "txt_val_2", text: "$599.00")
  span(:value_3, id: "txt_val_4", text: "$850,139.99")
  span(:value_4, id: "txt_val_5", text: "$23,329.50")
  span(:value_5, id: "txt_val_6", text: "$566.27")
  span(:total_balance, id: "txt_ttl_val", text: "$1,000,000")

  @browser = Watir::Browser.new :chrome

end
