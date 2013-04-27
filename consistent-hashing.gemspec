# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "consistent-hashing"
  s.version = File.read('version.txt').chomp

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dominik Liebler"]
  s.date = File.mtime('version.txt')
  s.description = "a Consistent Hashing implementation in pure Ruby using an AVL Tree"
  s.email = "liebler.dominik@googlemail.com"
  s.extra_rdoc_files = ["History.txt"]
  s.files = Dir.glob("{bin,lib,test,benchmark}/**/*") + %w(README.md History.txt Rakefile version.txt)
  s.homepage = "https://github.com/domnikl/consistent-hashing"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "consistent-hashing"
  s.rubygems_version = "1.8.16"
  s.summary = ""
  s.test_files = Dir.glob('test/**/*')

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<avl_tree>, [">= 1.1.3"])
    else
      s.add_dependency(%q<avl_tree>, [">= 1.1.3"])
    end
  else
    s.add_dependency(%q<avl_tree>, [">= 1.1.3"])
  end
end
