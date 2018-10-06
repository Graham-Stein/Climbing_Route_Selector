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


end
