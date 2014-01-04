$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'spec'))
require 'coveralls'
require 'simplecov'
Coveralls.wear!

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.yardoc'
end

require 'lib_spec'
