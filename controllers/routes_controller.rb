require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')
require_relative( '../models/route.rb' )
also_reload( '../models/*' )

get ('/routes') do
  @routes = Route.all()
  erb(:"routes/index")
end

get ('/routes/new') do
  @crags = Crag.all()
  erb(:"routes/new")
end

post ('/routes/') do
  Route.new(params).save
  redirect to '/routes'
end
