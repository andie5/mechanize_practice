require 'rubygems'
require 'bundler/setup'
require 'mechanize'

# Instantiate a new Mechanize
agent = Mechanize.new

# Grab and parse our page in one step
# like we did with Nokogiri and open-uri
# Mechanize stored any cookies that were set, and followed any redirects that google may have sent. The agent gave us back a page that we can use to scrape data, find links to click, or find forms to fill out.
page = agent.get('http://google.com/')

# # Now that we've fetched google's homepage, let's try listing all of the links:
# page.links.each do |link|
#   puts link.text
# end

#  # If you wanted to click on the first news link, you could do this
# page = agent.page.link_with(:text => 'News')[1].click


# # Grab the form of class="f" from the page
google_form = page.form('f')

# # Grab the form by ID or action
# another_form = page.form_with(:id => "some-id")
# another_form = page.form_with(:action => "/some_path")

# Fill in the field named "q" (Google's search query)
google_form.q = 'ruby mechanize'

# Actually submit the form
page = agent.submit(google_form, google_form.buttons.first)



# Print out the page using the "pretty print" command
pp page