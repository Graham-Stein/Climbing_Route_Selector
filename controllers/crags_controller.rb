require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')
require_relative( '../models/crag.rb' )
also_reload( './models/*' )

# get ('/crags') do
#   "Hello World"
#   # @crags = Crag.all()
#   # binding.pry
#   # erb(:"crags/index")
# end

get ('/crags') do
  @crags = Crag.all()
  erb(:"crags/index")
end
