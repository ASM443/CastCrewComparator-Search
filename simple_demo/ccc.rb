require "net/http"

imdb_key = File.read("imdb_key")


filmName1 = "mr.robot" 
filmName2 = "Lincoln" 

uri1 = URI("https://imdb-api.com/en/API/Search/#{imdb_key}/#{filmName1}")
uri2 = URI("https://imdb-api.com/en/API/Search/#{imdb_key}/#{filmName2}")
result1 = HTTP.get(uri1)
result2 = HTTP.get(uri2)

film_id1 = result1.parse['results'][0]['id']
film_id2 = result2.parse['results'][0]['id']

cast_uri1 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_key}/#{film_id1}")
castList1= HTTP.get(cast_uri1)

mr_robot_cc = Net::HTTP.get(uri).parse

cast_uri2 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_key}/#{film_id2}")
castList2= HTTP.get(cast_uri2)


ccnames1 = castList1.to_s.scan(/name":"([a-zA-z ]* [a-zA-z]*)/)
ccnames2 = castList2.to_s.scan(/name":"([a-zA-z ]* [a-zA-z]*)/)

intersection = ccnames1 & ccnames2
