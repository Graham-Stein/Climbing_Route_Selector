require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')
require_relative( '../models/crag.rb' )
also_reload( '../models/*' )

get ('/crags') do
  @crags = Crag.all()
  erb(:"crags/index")
end
