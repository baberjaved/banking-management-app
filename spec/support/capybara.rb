# require "selenium/webdriver"

# Capybara.register_driver :firefox do |app|
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :firefox
#   )
# end

# Capybara.register_driver :headless_firefox do |app|
#   browser_options = ::Selenium::WebDriver::Firefox::Options.new
#   browser_options.args << '--headless'

#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :firefox,
#     options: browser_options
#   )
# end

# Capybara.default_max_wait_time = 10
# Capybara.javascript_driver = :selenium_chrome_headless
