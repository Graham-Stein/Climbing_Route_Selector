# Climbing_Route_Selector

This solo project was completed in Week 5 of the 16 Week Software Developers Course at CodeClan. The first 4 weeks of the course covered 
HTML, CSS, Ruby, SQL structured databases and Sinatra. This protect was set as an exercise to tie these together in a practical package. 
Details of the design spec are in the attached brief 

// Insert instructions for setup...
From the top level in the route_selector folder:

Create Database in PSQL:
psql -d climbing_guides -f db/climbing_guides.sql

Seed the database with some sample data:
ruby db/seeds.rb 

Install Sinatra (Sinatra is a light-weight Ruby web framework):
gem install sinatra sinatra-contrib

Run the programme using:
ruby app.rb

The app webpage is available on:
http://localhost:4567

Future work:
1. Improve the css to provide a clearer layout of menu items.
2. Increase the database (find a way of importing the required route data and automating addition of the data to the db).
