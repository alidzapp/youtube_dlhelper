# encoding: utf-8
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'bundler/gem_tasks'
require 'rubygems'
require 'rainbow/ext/string'

task :default do
  puts 'Using the default task'
end

# Bundler Task
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

# RSpec Task
require 'rspec/core'
require 'rspec/core/rake_task'
desc 'Does anything with RSpec'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end
task :default => :spec

# Coveralls Task
require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => [:spec, 'coveralls:push']

# Yard Task
require 'yard'
desc 'Run yarddoc for the source'
YARD::Rake::YardocTask.new do |t|
  t.files   = %w(lib/**/*.rb ChangeLog.md LICENSE.rdoc) # optional
end

# Rubocop
require 'rubocop/rake_task'
desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # don't abort rake on failure
  task.fail_on_error = false
end

# Reek
require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.name          = 'reek'
  t.config_file   = 'config.reek'
  t.source_files  = 'lib/**/*.rb'
  t.reek_opts     = '' # -U
  t.fail_on_error = false
  t.verbose       = true
end

# Setup procedure
desc 'Launching the setup'
task :setup_start do
  version = YoutubeDlhelperVersion::Version::STRING
  puts '######################################################'.color(:yellow)
  puts '#            youtube_dlhelper Setup                  #'.color(:yellow)
  puts "#            Version: #{version}                        #".color(:yellow)
  puts '#                                                    #'.color(:yellow)
  puts '# Please file bugreports on:                         #'.color(:yellow)
  puts '# http://saigkill.ddns.net:8112/dashboard            #'.color(:yellow)
  puts '######################################################'.color(:yellow)
end

require 'fileutils'
desc 'Install Config file'
task :check_config do
  puts 'Checking Config file'.color(:yellow)
  home = Dir.home
  configorig = File.expand_path(File.join(File.dirname(__FILE__), 'lib/PublicanCreators', 'youtube_dlhelper.conf'))
  if File.exist?("#{home}/.youtube_dlhelper.conf")
    FileUtils.cp("#{configorig}", "#{home}/.youtube_dlhelper.conf.new")
    puts "The newest config file was placed in #{home}/.youtube_dlhelper.conf.new".color(:yellow)
    puts "Please check if new parameters are shipped. If any are missed in your old config please add them into your file. Then remove #{home}/.youtube_dlhelper.conf.new".color(:blue)
  else
    FileUtils.cp("#{configorig}", "#{home}/.youtube_dlhelper.conf")
    puts "Config file not found. Copying the newest for you to #{home}/.youtube_dlhelper.conf".color(:yellow)
    if File.exist?('/usr/bin/gedit')
      editor = 'gedit'
    elsif File.exist?('/usr/bin/kate')
      editor = 'kate'
    elsif File.exist?('/usr/bin/moudepad')
      editor = 'mousepad'
    elsif File.exist?('/usr/bin/geany')
      editor = 'geany'
    elsif File.exist?('/usr/bin/jedit')
      editor = 'jedit'
    end
    system("#{editor} #{home}/.youtube_dlhelper.conf")
  end
end