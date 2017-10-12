require "rubygems"
require "nokogiri"
require "open-uri"
   
page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))  

# COMMOM METHODS 

puts page.class   # => Nokogiri::HTML::Document
puts page.css("title") #The <title> element
puts page.css("li")  #All <li> elements
puts page.css("li")[0].text  #The text of the first <li> element
puts page.css("li")[1]["href"]  #The url of the second <li> element
puts page.css("li[data-category='news']")  #The <li> elements with a data-category of news
puts page.css("div#funstuff")[0]  #The <div> element with an id of "funstuff"
puts page.css("div#reference a")  #The <a> elements nested inside the <div> element that has an id of "reference"



# SPECIFIC METHODS

# 1 - Get an attribute of an element (here links)
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com


# 2 - Use select : here there are two anchor tags with class attributes = "news". 
# This is how to grab only those:
news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com
puts news_links.class   #=>   Array


# 3 - Use CSS selectors to specify attribute values - shorter version of the above !!

news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet


# 4 - Target specific elements with css boucle (here calls css 2 times)

page.css('p').css("a[data-category=news]").css("strong")

# This line only target <strong> elements within <a> tags that have an attribute data-category set to "news" 
# Any other <strong> elements that aren't children of such anchor tags won't be selected.


# 5 - Nested elements selection

page.css('p').css("a strong") # same but simpler than page.css('p').css("a").css("strong")

# To specify elements within another element, separate the element names with a space. 

a img # this selector would select all image tags that are within anchor tags
div a img # selects all image tags within anchor tags that themselves are within div tags