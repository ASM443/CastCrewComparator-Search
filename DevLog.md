6/25/22
The purpose of this project is to get my feet wet with web development. This app will will use Rails and Tailwinds and have a Rails API. First I will make a simple ruby project that scrapes the imdb fullcast page then find the cast and crew members in common add their IMDB page to a list. Next I will translate the project to a rails app with a pretty interface using Tail winds.

I made a script (simple_demo/ccc.rb) that uses the imdb API to get all the cast and crew from a film or show and finds the people in common. I don't need to scrape the imdb page since the API is better. Next I will build a rails app and try to implment to same thing just with basic text.

6/26/22
Added tailwindcss to the project and added route to the homepage.

8/21/22
Added Cast Model. Can now add two films and the contoller will output all cast members in common, to the console. There is an issue where the film searched is not the desired film, either a film or show with the same name or partly the same. Need to implement proper search feature. The process of calling the imdb api and ruby code is slow, around 5 seconds, need to find the bottleneck. 

8/22/22
Added a new database for cast members. Queried the imdb API to get known works and image of cast members. Found there is 100 limit to API calls. 

8/23/22
The view now shows the name and picture of 1 cast/crew member in common. Knowing that the amount of free API calls is limited has changed my goals for the project. One search would require 2 calls to the search API, 2 calls to get the list of cast/crew members, and 1 call per person person on the results page. So finding 5 people in common between 2 movies would require 9 API calls, which will quickliy reach the 100 call daily limit.
