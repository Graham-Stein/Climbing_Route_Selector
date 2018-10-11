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

get ('/crags/new') do
  @books = Book.all()
  erb(:"crags/new")
end

post ('/crags/') do
  Crag.new(params).save
  redirect to '/crags'
end

get ('/crags/:id/edit') do
  @crag = Crag.find(params[:id])
  erb(:"crags/edit")
end

post ('/crags/:id') do
  Crag.new(params).update
  redirect to ('/crags')
end

post ('/crags/:id/delete') do
  crag = Crag.find(params[:id])
  crag.delete()
  redirect to '/crags'
end

#############POSITION OF THIS MATTERS!!!#########
get ('/crags/:id') do
  "Herow Hanz"
  @crags = Crag.find_crag_name(params[:crag_name])
  erb(:"crags/index")
end
