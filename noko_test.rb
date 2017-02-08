require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.emptybottle.com/full/'))

# doc.xpath('//a[@class="show_full').each do |headline|
#   puts healine.text

show_html = doc.css('div.tw-plugin-full-event-list ul li div.show_full span.show_details')
show_details = show_html.map do |link|
  {
    date: link.css('span.show_date span.tw-event-date-complete span.tw-event-date').children.to_s.strip,
    time: link.css('span.show_date span.tw-event-time-complete span.tw-event-time').children.to_s.strip,
    artists: link.css('span.show_artists ul li').children.map { |el| el.to_s.strip }
  }
end

puts show_details



# each through entire show list while creating hashes for each concert
# hash should contain date, show time, array of bands
