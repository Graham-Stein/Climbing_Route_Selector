require('pry')
require_relative('../db/sql_runner.rb')

class Route

  attr_reader :id, :crag_id
  attr_accessor :route_name, :summer_grade, :winter_grade, :length

  def initialize(options)
    @id = options['id'].to_i
    @route_name = options['route_name']
    @summer_grade = options['summer_grade']
    @winter_grade = options['winter_grade']
    @length = options['length'].to_i
    @crag_id = options['crag_id'].to_i

  end

  def save()
    sql = "INSERT INTO routes (
    route_name,
    summer_grade,
    winter_grade,
    length,
    crag_id
    )
    VALUES(
      $1, $2, $3, $4, $5
    )
    RETURNING *;"
    values = [@route_name, @summer_grade, @winter_grade, @length, @crag_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM routes;"
    routes = SqlRunner.run(sql)
    result = routes.map { |route|  Route.new(route) }
    return result
  end
  
  def update()
    sql = "UPDATE routes
    SET (
      route_name,
      summer_grade,
      winter_grade,
      length,
      crag_id
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@route_name, @summer_grade, @winter_grade, @length, @crag_id, @id]
      SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM routes;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM routes
    WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
