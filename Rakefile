# encoding: utf-8
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(File.dirname(__FILE__), 'lib/youtube_dlhelper/version')

# Bundler Task
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

# Jeweler Task
require 'rake'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name        = 'youtube_dlhelper'
  gem.version     = YoutubeDlhelperVersion::Version::STRING
  gem.homepage    = 'https://github.com/saigkill/youtube_dlhelper'
  gem.license     = 'GPL-3'
  gem.summary     = 'Youtube Downloadhelper and Ripper'
  gem.description = 'This is a Youtube Downloadhelper who downloads a file, rips it to mp3 and placed it in a organized form'
  gem.email       = 'Sascha.Manns@directbox.com'
  gem.authors     =  ['Sascha Manns']
  gem.date        =  ENV['from'] ? Date.parse(ENV['from']) : Date.today
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

# RSpec Task
#require 'rspec/core'
#require 'rspec/core/rake_task'
#RSpec::Core::RakeTask.new(:spec) do |spec|
#  spec.pattern = FileList['spec/**/*_spec.rb']
#end
#task :default => :spec

# Coveralls Task
require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => [:spec, 'coveralls:push']

# Yard Task
require 'yard'
desc 'Run yarddoc for the source'
YARD::Rake::YardocTask.new do |t|
  t.files   = %w(lib/**/*.rb ChangeLog.md LICENSE.rdoc TODO.md) # optional
end
