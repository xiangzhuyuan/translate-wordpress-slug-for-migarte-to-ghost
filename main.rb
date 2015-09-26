require 'oj'
require 'uri'
require 'easy_translate'
# read json

#oogle translation api key
EasyTranslate.api_key = "YOUR API KEY"

# source
origin_json           = './json_file/wp2ghost_export_1443106121.json'
# output
output_json           = './result/posts.json'

i = 0

begin
  file   = File.read(origin_json)
  source = Oj.load(file)
rescue => e
  puts e.message
end
puts "we have #{source['data']['posts'].length} posts!!!!"
source['data']['posts'].each { |item|
  begin
    puts "starting the #{i+=1} post slug translation!!!"
    puts URI.unescape(item['slug'])
    puts EasyTranslate.translate(URI.unescape(item['slug']), :to => :en)
    item['slug'] = EasyTranslate.translate(URI.unescape(item['slug']), :to => :en).downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  rescue => e
    puts e.message
  end
  sleep 3


}

begin
  File.open(output_json, 'w') do |f|
    f.write(Oj.dump(source))
  end
rescue => e
  puts e.message
end

puts "DONE!"