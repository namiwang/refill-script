require "test/unit"

require "refill"

class TestRefill < Test::Unit::TestCase
  def test_version
    assert_not_nil Refill::VERSION
  end
end
