require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../book.rb')

class TestBook < MiniTest::Test

  # def setup()
  #
  # end

  def test_book_initialize
    binding.pry
    assert_equal(1, route())
  end

end
