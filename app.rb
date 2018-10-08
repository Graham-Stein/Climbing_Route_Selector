require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/books_controller')
require_relative('controllers/crags_controller')
require_relative('controllers/routes_controller')

# require_relative( './models/crag.rb' )

get '/' do
  erb( :index )
end
