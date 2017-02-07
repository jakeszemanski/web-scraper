require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

# doc.xpath('//a[@class="show_full').each do |headline|
#   puts healine.text

shows = []

doc.css('div.tw-plugin-full-event-list ul li div.show_full span.show_details').each do |link|
  shows << {
    'show_date' => doc.css('span.show_date span.tw-event-date-complete').text,
    'show_time' => doc.css('span.show_date span.tw-event-time-complete').text}
    puts link.content
end

puts shows[0]['show_time']



# each through entire show list while creating hashes for each concert
# hash should contain date, show time, array of bands