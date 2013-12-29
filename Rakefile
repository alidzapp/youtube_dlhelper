# encoding: utf-8
require File.expand_path('lib/youtube_dlhelper/version')

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

# Rake Test Task
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.warning = true
end

# SimpleCov Formatter Task
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '.yardoc'
end
task :default => :test

require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => [:spec, :features, 'coveralls:push']

# RDoc Task
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "jeweler_test #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'bundler/setup'
require 'appraisal'
Bundler::GemHelper.install_tasks

desc 'Set permissions on all files so they are compatible with both user-local and system-wide installs'
task :fix_permissions do
  system 'bash -c "find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \;"'
end

# Enforce proper permissions on each build
Rake::Task[:build].prerequisites.unshift :fix_permissions
