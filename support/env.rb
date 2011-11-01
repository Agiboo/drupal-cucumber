require 'capybara/cucumber'
require 'rspec'

app_base_path = ENV['BASE_PATH']
Capybara.app_host = "http://#{app_base_path}/"

if ENV['DRIVER'].eql?'selenium'
  Capybara.default_driver = :selenium
else
  fail 'Error, unknown driver parameter.'
end
 
class DrupalWorld
end

World do
  DrupalWorld.new
end
