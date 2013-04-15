require 'rubygems' if RUBY_VERSION !~ /^1\.9/

# Main module
#
module ConsistentHashing
  LIBPATH = ::File.expand_path('..', __FILE__) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  VERSION = ::File.read(PATH + 'version.txt').strip

  # Internal: loads all necessary lib files
  #
  def self.load_lib
    require File.join(LIBPATH, 'consistent_hashing', 'virtual_point')
    require File.join(LIBPATH, 'consistent_hashing', 'ring')
    require File.join(LIBPATH, 'consistent_hashing', 'avl_tree')
  end
end

ConsistentHashing.load_lib
