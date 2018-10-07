require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require('pry')
require_relative( '../models/book.rb' )
also_reload( '../models/*' )

get ('/books') do
  @books = Book.all()
  erb(:"books/index")
end

get ('/books/new') do
  erb(:"books/new")
end

post ('/books') do
  Book.new(params).save
  redirect to '/books'
end

# NO METHOD ERROR Even though Book.find is a METHOD
# and it works just fine away from this route...
get ('/books/:id/edit') do
  @book = Book.find(params[:id])
  binding.pry
  erb(:"books/edit")
end
