# 環境設定
# brew install phantomjs

# gem i 'capybara'
# gem i 'selenium-webdriver'
# gem i 'watir-webdriver'
# gem i 'poltergeist'

require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'nokogiri'
require 'logger'

Capybara.run_server = false
# Capybara.current_driver = :selenium
Capybara.current_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { phantomjs_logger: Logger.new('/dev/null')} )
end

Capybara.javascript_driver = :poltergeist

url1 = 'http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=072'
url2 = 'http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=068'

class Crawler
	include Capybara::DSL
	def carwler(url)
		start_time = Time.now
		visit(url)
		doc = Nokogiri::HTML.parse(page.html)
		visit(url)
		doc = Nokogiri::HTML.parse(page.html)
		title = doc.css('td.font_03').children[0].to_s.split(" ").first
		total = doc.css('td.font_03').children[1].to_s.split(" ").first
		space = doc.css('td.font_03').children[2].to_s.split(" ").first
		total_count = doc.css('td#labTotal').children.to_s
		space_count = doc.css('td#labSpace').children.to_s
		if title && total && space && total_count && space_count
			puts title
			puts total + ": " + total_count
			puts space + ": " + space_count
		else
			puts "網路不穩，請再試一次"
		end
		end_time = Time.now
  	puts end_time - start_time
	end
end

crawler = Crawler.new
crawler.carwler(url1)
crawler.carwler(url2)


