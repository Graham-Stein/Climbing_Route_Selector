require('pry')

require_relative('../models/route.rb')
require_relative('../models/crag.rb')
require_relative('../models/book.rb')

Route.delete_all
Crag.delete_all
Book.delete_all

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

options = {
  "area" => "Glen Coe",
  }
book3 = Book.new(options)
book3.save

list = Book.all
# binding.pry

options = {
  "crag_name" => "Carn Dearg Buttress",
  "elevation" => 800,
  "aspect" => "NE",
  "book_id" => book1.id
  }
  crag1 = Crag.new(options)
  crag1.save

options = {
  "crag_name" => "Indicator Wall",
  "elevation" => 1200,
  "aspect" => "NW",
  "book_id" => book1.id
  }
  crag2 = Crag.new(options)
  crag2.save

options = {
  "crag_name" => "Slime Wall",
  "elevation" => 600,
  "aspect" => "NW",
  "book_id" => book3.id
  }
  crag3 = Crag.new(options)
  crag3.save

options = {
  "crag_name" => "Etive Slabs",
  "elevation" => 300,
  "aspect" => "ESE",
  "book_id" => book3.id
  }
  crag4 = Crag.new(options)
  crag4.save

  crag_list = Crag.all


  options = {
    "route_name" => "Centurion",
    "summer_grade" => "HVS 5a",
    "winter_grade" => "VIII, 8",
    "length" => 190,
    "crag_id" => crag1.id
    }
    route1 = Route.new(options)
    route1.save

  options = {
    "route_name" => "The Bat",
    "summer_grade" => "E2",
    "winter_grade" => nil,
    "length" => 190,
    "crag_id" => crag1.id
    }
    route2 = Route.new(options)
    route2.save

  options = {
    "route_name" => "The Bullroar",
    "summer_grade" => "HVS",
    "winter_grade" => nil,
    "length" => 285,
    "crag_id" => crag1.id
    }
    route7 = Route.new(options)
    route7.save

  options = {
    "route_name" => "Torro",
    "summer_grade" => "E2",
    "winter_grade" => nil,
    "length" => 215,
    "crag_id" => crag1.id
    }
    route8 = Route.new(options)
    route8.save

  options = {
    "route_name" => "Rhyme of the Ancient Mariner",
    "summer_grade" => nil,
    "winter_grade" => "VII, 7",
    "length" => 160,
    "crag_id" => crag2.id
    }
    route3 = Route.new(options)
    route3.save

  options = {
    "route_name" => "Psychedelic Wall",
    "summer_grade" => nil,
    "winter_grade" => "VI, 5",
    "length" => 140,
    "crag_id" => crag2.id
    }
    route4 = Route.new(options)
    route4.save

  options = {
    "route_name" => "Bludger's Revelation",
    "summer_grade" => "HVS, 5a",
    "winter_grade" => nil,
    "length" => 141,
    "crag_id" => crag3.id
    }
    route5 = Route.new(options)
    route5.save

  options = {
    "route_name" => "Shibboleth",
    "summer_grade" => "E2, 5c",
    "winter_grade" => nil,
    "length" => 167,
    "crag_id" => crag3.id
    }
    route6 = Route.new(options)
    route6.save

  options = {
    "route_name" => "The Long Wait",
    "summer_grade" => "E2, 5c",
    "winter_grade" => nil,
    "length" => 255,
    "crag_id" => crag4.id
    }
    route9 = Route.new(options)
    route9.save

  options = {
    "route_name" => "Spartan Slab",
    "summer_grade" => "VS",
    "winter_grade" => nil,
    "length" => 190,
    "crag_id" => crag4.id
    }
    route10 = Route.new(options)
    route10.save

  options = {
    "route_name" => "Hammer",
    "summer_grade" => "HVS",
    "winter_grade" => nil,
    "length" => 150,
    "crag_id" => crag4.id
    }
    route11 = Route.new(options)
    route11.save

    Route.all

    check = Crag.all_in_book(book1.id)

    check2 = Route.all_on_crag(crag1.id)

    # Book.find(8)
    # binding.pry

    # route2.length = 50000
    # route2.update
  # book2.delete
  # crag2.delete
  # crag2.crag_name = "Tower Ridge"
  # binding.pry
  # crag2.update
  # binding.pry



# book1.area = "N Highlands"
# binding.pry
# book1.update

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
