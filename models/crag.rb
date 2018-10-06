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


end
