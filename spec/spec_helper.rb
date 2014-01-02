$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'coveralls'
require 'simplecov'
Coveralls.wear!

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.yardoc'
end

require 'youtube_dlhelper'
require 'youtube_dlhelper/libs'