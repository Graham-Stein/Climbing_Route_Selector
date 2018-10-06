class Book

  attr_reader :id
  attr_accessor :area

  def initialize(options)
    @id = options['id'].to_i
    @area = options['area']

  end


end
