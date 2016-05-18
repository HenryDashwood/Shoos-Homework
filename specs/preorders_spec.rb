require('minitest/autorun')
require_relative('../models/preorders')

class TestPreorder < Minitest::Test

  def setup
    options = {
      "first_name" => "Henry",
      "last_name" => "Dashwood",
      "size" => 10,
      "quantity" => 1
    }

    @preorder = Preorder.new(options)
  end

  def test_full_name
    assert_equal('Henry Dashwood', @preorder.full_name())
  end

  def test_full_order
    assert_equal('Henry Dashwood 10 1', @preorder.full_order())
  end

end