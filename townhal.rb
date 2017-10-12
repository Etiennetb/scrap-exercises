require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"
   

def get_the_email_of_a_townhal_from_its_webpage
	landing_page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    
    city_array = []
    city_links = landing_page.css("a[class=lientxt]")
    city_links.each do |link|   
    city_array << link['href'].sub!(".", "http://annuaire-des-mairies.com")
end
    	#puts city_array
	townhall_email_array = []
	city_array.each do |url|
	page = Nokogiri::HTML(open("#{url}"))

		content_array = page.css("td[class=style27]").text.split
	    content_array.each do |adress|
	    	townhall_email_array << adress if adress.include?("@")
	 end
end
	puts townhall_email_array
	puts townhall_email_array.size
end
get_the_email_of_a_townhal_from_its_webpage
