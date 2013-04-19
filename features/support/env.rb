UK_BASE_URL = "http://www.adzuna.co.uk/"
DE_BASE_URL = "http://www.adzuna.de/"

require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'active_record'
require 'test-factory'

$: << File.dirname(__FILE__)+'/../../lib'

require 'includes.rb'

World PageObject::PageFactory

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 180

browser_params = {:http_client => client}
# Saucelab set up
if ENV['USE_SAUCE'].eql? 'true'
    require 'sauce/cucumber'
    Sauce.config do |c|
      c[:start_tunnel] = true
    end
    driver = :remote
    caps = Selenium::WebDriver::Remote::Capabilities.firefox
    caps[:name] = 'Adzuna tests'
    browser_params[:desired_capabilities] = caps
    browser_params[:url] = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub"
end

driver ||= :firefox
browser = Watir::Browser.new( driver.to_sym, browser_params)

Before {
    @browser = browser
    @visited_page = JobsHomePageUK # Defaulting visited page to jobs home page
}

After do |scenario|
  Dir::mkdir('screenshots') if not File.directory?('screenshots')
  screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  if scenario.failed?
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end

at_exit { browser.close }
