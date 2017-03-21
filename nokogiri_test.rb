require 'nokogiri'
require 'pry'
require 'open-uri'

doc = Nokogiri::HTML(open("http://its.taipei.gov.tw/m/aspx/park/parkF.aspx?lang=Cht%C2%AEion=%E5%A3%AB%E6%9E%97%E5%8D%80&sn=072"))
puts doc
