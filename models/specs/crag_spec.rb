require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../crag.rb')

class TestCrag < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "crag_name" => "Carn Dearg Buttress",
      "elevation" => 800,
      "aspect" => "NE",
      "book_id" => 5
      }
# binding.pry
      @crag1 = Crag.new(options)
  end


  def test_crag_initialize
    # binding.pry
    assert_equal("Carn Dearg Buttress", @crag1.crag_name)
  end

  # def test_find
  #   assert_equal("Slime Wall", Crag.find(3).crag_name)
  # end
  # TEST ONLY WORKS IF DB SET UP

end
