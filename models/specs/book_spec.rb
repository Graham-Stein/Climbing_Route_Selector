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

  # def test_find
  #   assert_equal("Cairngorms", Book.find(2).area)
  # end
  # TEST ONLY WORKS IF DB SET UP

end
