require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../route.rb')

class TestRoute < MiniTest::Test

  def setup()
    options = {
      "id" => 1,
      "route_name" => "Centurion",
      "summer_grade" => "HVS 5a",
      "winter_grade" => "VIII, 8",
      "length" => 190,
      "crag_id" => 5
      }
# binding.pry
      @route1 = Route.new(options)
  end


  def test_route_initialize
    # binding.pry
    assert_equal("Centurion", @route1.route_name)
  end

end
