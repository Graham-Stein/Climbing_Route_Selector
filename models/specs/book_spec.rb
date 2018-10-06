require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../book.rb')

class TestBook < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "area" => "Ben Nevis",
      }
# binding.pry
      @book1 = Book.new(options)
  end


  def test_book_initialize
    # binding.pry
    assert_equal("Ben Nevis", @book1.area)
  end

end
