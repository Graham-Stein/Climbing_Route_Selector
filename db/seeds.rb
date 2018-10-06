require('pry')

require_relative('../models/route.rb')
require_relative('../models/crag.rb')
require_relative('../models/book.rb')


options = {
  "area" => "Ben Nevis",
  }
book1 = Book.new(options)
book1.save

options = {
  "area" => "Cairngorms",
  }
book2 = Book.new(options)
book2.save

list = Book.all
binding.pry
nil
# options = {
#   "id" => 1,
#   "crag_name" => "Carn Dearg Buttress",
#   "elevation" => 800,
#   "aspect" => "NE",
#   "book_id" => 5
#   }
#
# options = {
#   "id" => 1,
#   "route_name" => "Centurion",
#   "summer_grade" => "HVS 5a",
#   "winter_grade" => "VIII, 8",
#   "length" => 190,
#   "crag_id" => 5
#   }
