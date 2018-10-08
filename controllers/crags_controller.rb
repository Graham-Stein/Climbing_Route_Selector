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

get ('/crags/:id/edit') do
  @crag = Crag.find(params[:id])
  erb(:"crags/edit")
end

post ('/crags/:id') do
  Crag.new(params).update
  redirect to ('/crags')
end
