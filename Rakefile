# encoding: utf-8

require 'rubygems'
require 'bundler'
require File.expand_path('lib/youtube_dlhelper/version')

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
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
  gem.date        = '2013-12-24'
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

#require 'rcov/rcovtask'
#Rcov::RcovTask.new do |test|
#  test.libs << 'test'
#  test.pattern = 'test/**/test_*.rb'
#  test.verbose = true
#  test.rcov_opts << '--exclude "gems/*"'
#end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jeweler_test #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
