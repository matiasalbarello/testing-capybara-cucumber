require 'capybara'
require 'capybara/rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'byebug'

Dir['./lib/**/*.rb'].each { |f| require f }

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :selenium_chrome)
end

Capybara.javascript_driver = :selenium_chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end