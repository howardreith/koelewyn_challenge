require 'watir'
require 'page-object'
require 'page-object/page_factory'

World(PageObject::PageFactory)

Before do

  @browser = Watir::Browser.new :chrome
  # @browser.window.maximize
  @site = Site.new(@browser)

end

After do

  @browser.close

end
