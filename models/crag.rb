require('pry')
require_relative('../db/sql_runner.rb')

class Crag

  attr_reader :id, :book_id
  attr_accessor :crag_name, :elevation, :aspect

  def initialize(options)
    @id = options['id'].to_i
    @crag_name = options['crag_name']
    @elevation = options['elevation']
    @aspect = options['aspect']
    @book_id = options['book_id'].to_i

  end

  def book()
    sql = "SELECT * FROM books where id = $1"
    values = [@book_id]
    book = SqlRunner.run(sql, values)
    result = Book.new(book[0])
    return result
  end

  def save()
    sql = "INSERT INTO crags(
    crag_name,
    elevation,
    aspect,
    book_id
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING *"
  values = [@crag_name, @elevation, @aspect, @book_id]
  crag_data = SqlRunner.run(sql, values)
  @id = crag_data[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM crags;"
    crags = SqlRunner.run(sql)
    result = crags.map { |crag|  Crag.new(crag) }
    return result
  end

  def self.all_in_book(id)
    sql = "SELECT * FROM crags
    WHERE crags.book_id = $1;"
    values = [id]
    crags = SqlRunner.run(sql, values)
    result = crags.map { |crag|  Crag.new(crag) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM books
    WHERE id = $1;"
    values = [id]
    book = SqlRunner.run(sql, values)
    result = Crag.new(book[0])
    return result
  end

  def update()
    sql = "UPDATE crags
    SET
    (
      crag_name,
      elevation,
      aspect,
      book_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@crag_name, @elevation, @aspect, @book_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM crags;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM crags
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
