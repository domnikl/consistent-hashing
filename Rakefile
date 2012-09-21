require 'rubygems'

begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'consistent-hashing'
  authors  'Dominik Liebler'
  email    'liebler.dominik@googlemail.com'
  url      'https://github.com/domnikl/consistent-hashing'
  ignore_file  '.gitignore'
  depend_on 'avl_tree'
}
