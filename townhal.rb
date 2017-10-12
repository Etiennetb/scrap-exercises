require "rubygems"
require "nokogiri"
require "open-uri"
require "pry"
   
#get_the_email_of_a_townhal_from_its_webpage
 def get_webpage_content
 	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/ableiges.html"))
		puts page.class

	content_array = page.css("td[class=style27]").text.split
    email_array = []
    
    content_array.each do |adress|
    	email_array << adress if adress.include?("@")
 end
 puts email_array
end

def get_all_links
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    
    city_links = page.css("a[class=lientxt]")
    city_links.each{|link| puts link['href'].sub!(".", "http://annuaire-des-mairies.com")}
   
   

end

get_webpage_content
get_all_links