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

  def crag()
    sql = "SELECT * FROM crags where id = $1"
    values = [@crag_id]
    crag = SqlRunner.run(sql, values)
    result = Crag.new(crag[0])
    return result
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

  def self.all_on_crag(id)
    sql = "SELECT * FROM routes WHERE crag_id = $1;"
    values = [id]
    result = Route.filter(sql, values)
    # routes = SqlRunner.run(sql, values)
    # result = routes.map { |route|  Route.new(route) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM routes
    WHERE id = $1;"
    values = [id]
    route = SqlRunner.run(sql, values)
    result = Route.new(route[0])
    return result
  end

  def self.find_route_name(name)
    sql = "SELECT * FROM routes
    WHERE route_name ILIKE $1;"
    values = ['%' + name.to_s + '%']
    result = Route.filter(sql, values)
    # routes = SqlRunner.run(sql, values)
    # result = routes.map { |route|  Route.new(route) }
    return result
  end

  def self.filter(sql, values)
    routes = SqlRunner.run(sql, values)
    result = routes.map { |route|  Route.new(route) }
    return result
  end

  def self.filter_routes_sql(filters)
    ## where filters is an array of filter items
    # that are column titles in the DB
    # method will take the filters items and add
    # these to a sql statement WHERE xxxx LIKE $1
    # AND yyyy LIKE $2 etc.
    sql = "SELECT * FROM routes INNER JOIN crags ON routes.crag_id = crags.id"
    added_sql = ""
    count = 0
    filters.each do |filter|

      if count == 0
        count += 1
        added_sql += " WHERE #{filter[0]} > $#{count} AND"
      elsif filter[1] == ""
        next
      elsif filter[1].scan(/\D/).empty? # is a number
        count += 1
        added_sql += " #{filter[0]} > $#{count} AND"
      else
        count += 1
        added_sql += " #{filter[0]} ILIKE $#{count} AND"
      end
    end
    added_sql = added_sql[0...-4]
    sql += added_sql + ";"
    return sql
  end

  def self.filter_routes_values(filters)
  #  Produce the values from the params hash to match the entries in
  # the slots of the prepared statement
  # (wildcards in 'values' where the input is text not purely numbers)
    values = []
    count = 0
    filters.each do |filter|
      count += 1
      if filter[1] == ""
        next
      elsif filter[1].scan(/\D/).empty?
        values.push("#{filter[1]}")
      else
        values.push("%#{filter[1]}%")
      end
    end
    return values
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

  def grade()
    sg = @summer_grade
    wg = @winter_grade
      if sg != nil && wg != nil
      grade = "#{sg} and #{wg}"
      elsif sg == nil
      grade = "#{wg}"
      elsif wg == nil
      grade = "#{sg}"
      end
    return grade
  end

end
