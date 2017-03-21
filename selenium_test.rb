require "selenium-webdriver"
require "pry"
# driver = Selenium::WebDriver.for :chrome
# driver.navigate.to "http://google.com"

# element = driver.find_element(name: 'q')
# element.send_keys "Hello WebDriver!"
# element.submit
# puts driver.title
# driver.quit

url1 = 'http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=072'
url2 = 'http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=068'
def carwler(url)
  start_time = Time.now
  driver = Selenium::WebDriver.for :chrome
  # driver = Selenium::WebDriver.for :firefox
  # driver = Selenium::WebDriver.for :safari

  driver.navigate.to url
  sleep 1
  driver.navigate.to url
  title = driver.find_elements(class: 'font_03')[0].text
  total = driver.find_elements(class: 'font_03')[1].text
  space = driver.find_elements(class: 'font_03')[2].text
  total_count = driver.find_element(id: 'labTotal').text
  space_count = driver.find_element(id: 'labSpace').text
  if title && total && space && total_count && space_count
    puts driver.title
    puts title
    puts total + ": " + total_count
    puts space + ": " + space_count
  else
    puts "網路不穩，請再試一次"
  end
  driver.quit
  end_time = Time.now
  puts end_time - start_time
end

carwler(url1)
carwler(url2)






