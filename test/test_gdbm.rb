require 'fileutils'
require 'test/unit'
require 'tmpdir'

require 'bundler/setup'
begin
  require 'gdbm'
rescue LoadError
end

if defined? GDBM
  class TestGDBM < Test::Unit::TestCase
    def setup
      @tmpdir = Dir.mktmpdir("tmptest_gdbm")
      @prefix = "tmptest_gdbm_#{$$}"
      @gdm_filename = "#{@tmpdir}/#{@prefix}_rdonly"
      @gdbm = GDBM.open(@gdm_filename)
    end

    def teardown
      FileUtils.remove_entry_secure @tmpdir
    end

    def test_gdbm_each_key_class_method_without_block_returns_enumerator
      assert_kind_of Enumerator, @gdbm.each_key
    end

    def test_gdbm_each_key_class_method_without_block_returns_enumerator_of_keys
      @gdbm['a'] = 'b'
      assert_equal ['a'], @gdbm.each_key.to_a
    end
  end
end
