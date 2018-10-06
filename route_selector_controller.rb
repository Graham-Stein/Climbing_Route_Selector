require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')

require_relative( './models/book.rb' )
require_relative( './models/crag.rb' )
require_relative( './models/route.rb' )
also_reload( './models/*' )

get ('/books') do
  @books = Book.all()
  erb(:index)
end
