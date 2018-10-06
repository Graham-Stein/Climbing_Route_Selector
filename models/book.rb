require('pry')
require_relative('../db/sql_runner.rb')

class Book

  attr_reader :id
  attr_accessor :area

  def initialize(options)
    @id = options['id'].to_i
    @area = options['area']
  end

  def save()
    sql = "INSERT INTO books(
    area
  )
  VALUES
  (
    $1
  )
  RETURNING *"
  values = [@area]
  book_data = SqlRunner.run(sql, values)
  @id = book_data[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM books;"
    books = SqlRunner.run(sql)
    result = books.map { |book|  Book.new(book) }
    binding.pry
    return result

  end

end
