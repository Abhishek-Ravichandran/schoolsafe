require 'soda/client'

client = SODA::Client.new({:domain => "data.phila.gov", :app_token => "A2UU0wuMdd6NOSuwVvjSu5i3u"})

results = client.get("sspu-uyfa", {"$where" => "within_circle(shape, 40.04, -75.13, 100)"})

puts "Got #{results.count} results. Dumping first results:"
results.first.each do |k, v|
  puts "#{k}: #{v}"
end