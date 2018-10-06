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
