require 'test/unit'

class TestRequireGDBM < Test::Unit::TestCase
  def test_ruby_has_gdbm
    assert_nothing_raised(LoadError) do
      require 'gdbm'
    end
  end
end
