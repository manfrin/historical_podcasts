require 'open-uri'

namespace :seeding do
  desc "Fills in History of Rome Podcast"
  task history_of_rome: :environment do
  	podcast = Podcast.where(name: 'The History of Rome').first_or_create
  	season = podcast.seasons.first_or_create

  	xml = Nokogiri::XML(open('http://feeds.feedburner.com/TheHistoryOfRome?format=xml'))
  	hash = Hash.from_xml(xml.to_xml)
  	items = hash['rss']['channel']['item']

  	ActiveRecord::Base.transaction do 
	  	items.each do |item|
	  		position = item['title'].split('-').first
	  		title = item['title'].split('-').second.try(:lstrip)
	  		url = item['content']['url']
	  		desc = item['subtitle']
	  		pub = item['pubDate']
	  		pub = DateTime.parse(pub)

	  		Episode.create!(season: season, title: title, external_link: url, description: desc, pub_date: pub)
	  	end
	  end
  end

end
