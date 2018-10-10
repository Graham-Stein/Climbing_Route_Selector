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

get ('/routes/:id/edit')do
  @route = Route.find(params[:id])
  erb(:"routes/edit")
end

post ('/routes/:id') do
  Route.new(params).update
  redirect to ('/routes')
end

post ('/routes/:id/delete') do
  route = Route.find(params[:id])
  route.delete()
  redirect to '/routes'
end

#############POSITION OF THIS MATTERS!!!#########
get ('/routes/:id') do
  @routes = Route.find_route_name(params[:route_name])
  erb(:"routes/index")
end
