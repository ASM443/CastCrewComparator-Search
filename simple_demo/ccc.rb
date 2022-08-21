require "net/http"
require "uri"
require 'json'


imdb_key = File.read("imdb_key")

puts "test 1:" + ARGV[0]
puts "test 2:" + ARGV[1]




filmName1 = ARGV[0]
filmName2 = ARGV[1]

uri1 = URI("https://imdb-api.com/en/API/Search/#{imdb_key}/#{filmName1}")
uri2 = URI("https://imdb-api.com/en/API/Search/#{imdb_key}/#{filmName2}")

result1 = Net::HTTP.get_response(uri1)
result2 = Net::HTTP.get_response(uri2)


film_id1 = JSON.parse(result1.body)['results'][0]['id']
film_id2 = JSON.parse(result2.body)['results'][0]['id']


cast_uri1 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_key}/#{film_id1}")
castList1= Net::HTTP.get_response(cast_uri1)

mr_robot_cc = Net::HTTP.get_response(cast_uri1)


cast_uri2 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_key}/#{film_id2}")
castList2= HTTP.get(cast_uri2)


ccnames1 = castList1.to_s.scan(/name":"([a-zA-z ]* [a-zA-z]*)/)
ccnames2 = castList2.to_s.scan(/name":"([a-zA-z ]* [a-zA-z]*)/)

intersection = ccnames1 & ccnames2

puts intersection
