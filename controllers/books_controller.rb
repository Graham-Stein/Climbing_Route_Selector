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

get ('/books/:id/edit') do
  @book = Book.find(params[:id])
  erb(:"books/edit")
end

post ('/books/:id') do
  Book.new(params).update
  redirect to '/books'

end

post ('/books/:id/delete') do
  book = Book.find(params[:id])
  book.delete()
  redirect to '/books'
end
