require 'coveralls'
Coveralls.wear!

# SimpleCov Formatter Task
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.yardoc'
end
task :default => :test

