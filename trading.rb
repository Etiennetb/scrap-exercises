require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"


 def get_currency_name
 	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		puts page.class

    currency_array = []
    name_array = page.css("a[class='price']")
    name_array.each do |name|   
    	currency_array << name['href'].sub!("/currencies/", "").sub!("/#markets", "")
	end

	price_array = []
	name_array.each do |price|
		price_array << price['data-usd']
	end

 puts currency_array
 puts price_array

 end
 


get_currency_name