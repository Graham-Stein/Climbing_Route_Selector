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
      @route1 = Route.new(options)

    options = {
      "id" => 1,
      "route_name" => "Centurion",
      "summer_grade" => nil,
      "winter_grade" => "VIII, 8",
      "length" => 190,
      "crag_id" => 5
      }
      @route2 = Route.new(options)

    options = {
      "id" => 1,
      "route_name" => "Centurion",
      "summer_grade" => "HVS 5a",
      "winter_grade" => nil,
      "length" => 190,
      "crag_id" => 5
      }
      @route3 = Route.new(options)

  end


  def test_route_initialize
    # binding.pry
    assert_equal("Centurion", @route1.route_name)
  end

  def test_summer_winter_grade_both
    assert_equal("HVS 5a and VIII, 8", @route1.grade)
  end

  def test_summer_winter_grade_sum_only
    assert_equal("HVS 5a", @route3.grade)
  end

  def test_summer_winter_grade_wtr_only
    assert_equal("VIII, 8", @route2.grade)
  end

end
