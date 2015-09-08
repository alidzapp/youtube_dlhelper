# encoding: utf-8
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'bundler/gem_tasks'
require 'rubygems'

# rubocop:disable Metrics/LineLength
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
RSpec::Core::RakeTask.new(:test) do |spec|
  spec.pattern = FileList['test/**/*_spec.rb']
end
task :default => :test

# Coveralls Task
require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => [:test, 'coveralls:push']

# Yard Task
require 'yard'
desc 'Run yarddoc for the source'
YARD::Rake::YardocTask.new do |t|
  t.files   = %w('lib/**/*.rb', 'bin/youtube_dlhelper', '-', 'CHANGELOG.md',
'CODE_OF_CONDUCT.md', 'LICENSE.md', 'README.md')
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

require 'bundler/audit/cli'
namespace :bundle_audit do
  desc 'Update bundle-audit database'
  task :update do
    Bundler::Audit::CLI.new.update
  end

  desc 'Check gems for vulns using bundle-audit'
  task :check do
    Bundler::Audit::CLI.new.check
  end

  desc 'Update vulns database and check gems using bundle-audit'
  task :run do
    Rake::Task['bundle_audit:update'].invoke
    Rake::Task['bundle_audit:check'].invoke
  end
end

task :bundle_audit do
  Rake::Task['bundle_audit:run'].invoke
end

# Setup procedure /Codeship
# dpkg -s ffmpeg 2>/dev/null >/dev/null && echo $?
desc 'Launching the setup'
task :setup_start do
  version = YoutubeDlhelperVersion::Version::STRING
  puts '######################################################'
  puts '#            youtube_dlhelper Setup                  #'
  puts "#            Version: #{version}                        #"
  puts '#                                                    #'
  puts '# Please file bugreports on:                         #'
  puts '#http://saigkill-bugs.myjetbrains.com/youtrack/issues#'
  puts '######################################################'

  system('setup uninstall --force')
  system('setup.rb config --sysconfdir=$HOME/.youtube_dlhelper')
  system('setup.rb install')
end

desc 'Link binary'
task :link_binary do
  # removing /usr/bin/youtube_dlhelper because setup.rb installs in PATH
  puts 'Removing binaries from /usr/bin ...'
  ytdlbin = '/usr/bin/youtube_dlhelper'
  system("sudo rm #{ytdlbin}") if File.exist?(ytdlbin)
end

desc 'Run setup'
task :setup => [:setup_start, :link_binary] do
  puts 'Finished Setup'
end

require 'fileutils'
desc 'Prepare Userdoc for translating'
task :prepare_doc do
  doc = './doc'
  FileUtils.cd(doc) do
    puts 'Running trans_drop'
    system('publican trans_drop')
    puts 'Preparing pot files'
    system('publican update_pot')
    puts 'Preparing po files for de-DE'
    system('publican update_po --langs=de-DE')
    puts 'All done. Please use a poeditor (like poedit) to translate'
    puts 'For building doc use rake build_doc.'
  end
end

require 'fileutils'
desc 'Build Userdoc'
task :build_doc do
  doc = './doc'
  FileUtils.cd(doc) do
    puts 'Building all targets'
    system('publican build --langs=en-US,de-DE --formats=html,pdf')
    puts 'All done. Please use rake publish_doc for publishing.'
  end
end

require 'fileutils'
desc 'Publish Userdoc'
task :publish_doc do
  version = YoutubeDlhelperVersion::Version::STRING
  home = Dir.home
  srcde = 'doc/tmp/de-DE/html'
  srcen = 'doc/tmp/en-US/html'
  srcdepdf = 'doc/tmp/de-DE/pdf'
  srcenpdf = 'doc/tmp/en-US/pdf'
  target = "#{home}/RubymineProjects/saigkill.github.com"
  targetde = "#{home}/RubymineProjects/saigkill.github.com/doc/youtube_dlhelper/de-DE/html"
  targeten = "#{home}/RubymineProjects/saigkill.github.com/doc/youtube_dlhelper/en-US/html"
  targetenpdf = "#{home}/RubymineProjects/saigkill.github.com/doc/youtube_dlhelper/en-US/pdf"
  targetdepdf = "#{home}/RubymineProjects/saigkill.github.com/doc/youtube_dlhelper/de-DE/pdf"

  puts 'Copying source html files to target git repository'
  FileUtils.cp_r(Dir["#{srcde}/*"], "#{targetde}")
  FileUtils.cp_r(Dir["#{srcen}/*"], "#{targeten}")
  FileUtils.cp_r(Dir["#{srcdepdf}/*"], "#{targetdepdf}")
  FileUtils.cp_r(Dir["#{srcenpdf}/*"], "#{targetenpdf}")

  puts 'Checking in into repository'
  FileUtils.cd(target) do
    puts 'Adding missing files'
    system('git add *')
    puts 'Made commit'
    system("git commit -m \"Updated doc for youtube_dlhelper #{version}\"")
    puts 'Pushing it to origin'
    system('git push')
  end
end

require 'yaml'
require 'MannsShared'
require 'fileutils'
desc 'Prepares for release'
task :make_release do
  version = YoutubeDlhelperVersion::Version::STRING
  home = Dir.home
  target = "#{home}/RubymineProjects/saigkill.github.com/_posts"
  time = Time.new
  date = time.strftime('%Y-%m-%d')
  config = YAML.load_file('Index.yml')
  oldversion = config['version']

  puts('Updating index')
  MannsShared.search_replace(oldversion, version, 'Index.yml')
  MannsShared.search_replace(oldversion, version, 'VERSION')
  system('index --using VERSION Index.yml')
  puts 'Updating MANIFEST'
  system('mast -u && mast -u')
  system('git add MANIFEST')
  puts 'done'
  puts 'Updating workspace'
  system('git add .idea/*')
  system('git commit -m "Updated workspace"')
  puts 'done'
  puts 'Making release'
  system('rake release')

  FileUtils.cd(target) do
    FileUtils.touch "#{date}-youtube_dlhelper-#{version}-released-en.md"
    File.write "#{date}-youtube_dlhelper-#{version}-released-en.md", <<EOF
---
layout: post
title: "youtube_dlhelper #{version} - A Gem for Youtubers"
description: "Yet another Youtube Downloader. But this one creates for you the right directories inside your Musicdir."
category: "programming"
tags: [ruby, opensource, youtube, en-US]
---
{% include JB/setup %}

# Introduction
The youtube_dlhelper is a short tool for download and manage the downloaded files. You are running the program inside the command line with a Youtube URL. Then it aska for a group name or interpreters name. Now it creates a Subfolder inside your Musicdirectory. Then it makes a MP3 from the downloaded file and moves it to the folder.

# Installation
If you give it a try just follow the next steps (If you have already Ruby installed):

  * gem install youtube_dlhelper
  * cd /path/to/gem (Falls RVM benutzt wird z.B. ~/.rvm/gems/ruby-2.2.1/gems/latex_curriculum_vitae)
  * rake setup

# Dependencies
You need to have ffmpeg or avconv installed. The soft dependencies will be solved by bundler.

# Running the Gem
   youtube_dlhelper https://yourYoutubeURL

# References
  * Projects home: [https://github.com/saigkill/youtube_dlhelper](https://github.com/saigkill/youtube_dlhelper)
  * User documentation (en): [http://saigkill.github.io/doc/youtube_dlhelper/en-US/html](http://saigkill.github.io/doc/youtube_dlhelper/en-US/html)
  * User documentation (de): [http://saigkill.github.io/doc/youtube_dlhelper/de-DE/html](http://saigkill.github.io/doc/youtube_dlhelper/de-DE/html)
  * Bug reports: [http://saigkill-bugs.myjetbrains.com/youtrack/issues](http://saigkill-bugs.myjetbrains.com/youtrack/issues)

# What has be done in this version #{version}?
  * Step 1
  * Step2

# Donations
[![publicancreators](https://pledgie.com/campaigns/29423.png?skin_name=chrome)](https://pledgie.com/campaigns/29423)
[![wishlist](http://tsv-neuss.de/cms/upload/News-Bilder/amazon1.png)](http://www.amazon.de/registry/wishlist/D75HOEQ00BDD)
EOF
  end
  FileUtils.cd(target) do
    FileUtils.touch "#{date}-youtube_dlhelper-#{version}-released-de.md"
    File.write "#{date}-youtube_dlhelper-#{version}-released-de.md", <<EOF
---
layout: post
title: "youtube_dlhelper #{version} - A Gem für Youtubers"
description: "Ein anderer YouTube Downloader und Konverter. Dieser erstellt automatisch die benötigten Verzeichnisse im Musicdir"
category: "programming"
tags: [ruby, opensource, youtube, de-DE]
---
{% include JB/setup %}

# Einführung
youtube_dlhelper ist ein kleines Tool zum Download und Konvertierung der files. Sie starten das Programm in der Kommandozeile mit der gewünschten Youtube URL. Das Programm fragt nun nach Parametern, wie der Name des Interpreten oder der Gruppe und erstellt innerhalb Ihres festgelegten Musikverzeichnis die benötigten Unterverzeichnisse.

# Installation
Wenn Ruby bereits installiert ist, können Sie youtube_dlhelper wie folgt installieren:

  * gem install youtube_dlhelper
  * cd /path/to/gem (Falls RVM benutzt wird z.B. ~/.rvm/gems/ruby-2.2.1/gems/latex_curriculum_vitae)
  * rake setup

# Abhängigkeiten
Sie benötigen ein installiertes ffmpeg oder avconv.

# Das Gem starten
  youtube_dlhelper https://yourYoutubeURL

# Referenzen
  * Projekt Home: [https://github.com/saigkill/youtube_dlhelper](https://github.com/saigkill/youtube_dlhelper)
  * User Dokumentation (en): [http://saigkill.github.io/doc/youtube_dlhelper/en-US/html](http://saigkill.github.io/doc/youtube_dlhelper/en-US/html)
  * User Dokumentation (de): [http://saigkill.github.io/doc/youtube_dlhelper/de-DE/html](http://saigkill.github.io/doc/youtube_dlhelper/de-DE/html)
  * Bugreports: [http://saigkill-bugs.myjetbrains.com/youtrack/issues](http://saigkill-bugs.myjetbrains.com/youtrack/issues)

# Was ist neu in version #{version}?
  * Step 1
  * Step2

# Donations
[![publicancreators](https://pledgie.com/campaigns/29423.png?skin_name=chrome)](https://pledgie.com/campaigns/29423)
[![wishlist](http://tsv-neuss.de/cms/upload/News-Bilder/amazon1.png)](http://www.amazon.de/registry/wishlist/D75HOEQ00BDD)
EOF
  end
  puts 'Prepared your Blogpost. Please add the changes of this release'
  puts 'Now ready for social media posting'

  # Create email to ruby-talk
  space = '%20'
  crlf = '%0D%0A'
  subject = "youtube_dlhelper #{version} released"
  subject.gsub!(/ /, "#{space}")
  body = 'Hello Ruby list,' + "#{crlf}" + "#{crlf}" +
      "i would like to announce the youtube_dlhelper gem in version #{version}." + "#{crlf}" + "#{crlf}" +
      "What happend in version #{version}?" + "#{crlf}" +
      '* Its the initial release' + "#{crlf}" +
      '* Fixed LCV 1-4' + "#{crlf}" + "#{crlf}" +
      'What is youtube_dlhelper?' + "#{crlf}" + "#{crlf}" +
      'The youtube_dlhelper is a short tool for download and manage the downloaded files. You are running the program inside the command line with a Youtube URL. Then it aska for a group name or interpreters name. Now it creates a Subfolder inside your Musicdirectory. Then it makes a MP3 from the downloaded file and moves it to the folder.' + "#{crlf}" + "#{crlf}" +
      'Installation:'+ "#{crlf}" + "#{crlf}" +
      '    gem install youtube_dlhelper' + "#{crlf}" +
      '    cd /path/to/gem \(In case of using RVM anything like ~/.rvm/gems/ruby-2.2.1/gems/youtube_dlhelper\)' + "#{crlf}" + "#{crlf}" +
      '    rake setup' + "#{crlf}" + "#{crlf}" +
      'Dependencies:'+ "#{crlf}" + "#{crlf}" +
      'You need to have ffmpeg or avconv installed. The soft dependencies will be solved by bundler.' + "#{crlf}" + "#{crlf}" +
      'Using the gem' + "#{crlf}" + "#{crlf}" +
      'To use the gem just type in the console:' + "#{crlf}" + "#{crlf}" +
      '    youtube_dlhelper https://yourYoutubeURL' + "#{crlf}" + "#{crlf}" +
      'References:' + "#{crlf}" +
      'Issue tracker: http://saigkill-bugs.myjetbrains.com/youtrack/issues' + "#{crlf}" +
      'Home: https://github.com/saigkill/youtube_dlhelper' + "#{crlf}" +
      'Greetings Sascha'
  body.gsub!(/ /, "#{space}")
  system("thunderbird mailto:ruby-talk@ruby-lang.org?subject=#{subject}\\&body=#{body}")
  system('rm pkg/*')
end

# vim: syntax=ruby