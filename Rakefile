# -*- ruby -*-
# Release:
# * update *.wiki markdown documentation for GitLab
# * enable :git
# * rake run_before_release
# * disable :git
# * Checkin
# * rake release
# * rake run_after_release

require 'rubygems'
require 'hoe'

Hoe.plugin :bundler
Hoe.plugin :email
Hoe.plugin :gemspec
# Hoe.plugin :gem_prelude_sucks
#Hoe.plugins.delete :git
Hoe.plugin :git
Hoe.plugin :manns
Hoe.plugin :packaging
Hoe.plugin :rubocop
Hoe.plugin :rubygems
#Hoe.plugin :seattlerb
Hoe.plugin :version

###########################################DEVELOPING ZONE##############################################################
# rubocop:disable Metrics/LineLength
Hoe.spec "youtube_dlhelper" do
  developer("Sascha Manns", "samannsml@directbox.com")
  license "MIT" # this should match the license in the README
  require_ruby_version '>= 2.2.0'

  email_to << 'ruby-talk@ruby-lang.org'

  self.history_file = 'History.rdoc'
  self.readme_file = 'README.rdoc'
  self.extra_rdoc_files = FileList['*.rdoc'].to_a
  self.post_install_message = '*** Run rake setup to finish the installation *** Please file bugreports and feature requests on: https://gitlab.com/saigkill/youtube_dlhelper/issues'

  dependency 'bundler', '~> 1.11'
  dependency 'setup', '~> 5.2'
  dependency 'parseconfig', '~> 1.0'
  dependency 'streamio-ffmpeg', '~> 2.0'
  dependency 'rainbow', '~> 2.1'
  dependency 'addressable', '~> 2.4.0'
  dependency 'notifier', '~> 0.5'
  dependency 'youtube-dl.rb', '~> 0.2.5.2015'

  extra_dev_deps << ['coveralls', '~> 0.8']
  extra_dev_deps << ['gem-release', '~> 0.7']
  extra_dev_deps << ['hoe-bundler', '~> 1.2']
  extra_dev_deps << ['hoe-gemspec', '~> 1.0']
  extra_dev_deps << ['hoe-git', '~> 1.6']
  extra_dev_deps << ['hoe-manns', '~> 1.4']
  extra_dev_deps << ['hoe-packaging', '~> 1.1']
  extra_dev_deps << ['hoe-rubocop', '~> 1.0']
  extra_dev_deps << ['hoe-rubygems', '~> 1.0']
  extra_dev_deps << ['hoe-seattlerb', '~> 1.3']
  extra_dev_deps << ['hoe-version', '~> 1.2']
  extra_dev_deps << ['indexer', '~> 0.3']
  extra_dev_deps << ['rake', '~> 10.4']
  extra_dev_deps << ['rspec', '~> 3.4']
  extra_dev_deps << ['rubocop', '~> 0.35']
  extra_dev_deps << ['simplecov', '~> 0.11']
  extra_dev_deps << ['bundler-audit', '~> 0.4']
  extra_dev_deps << ['manns_shared', '~> 1.0']
  #extra_dev_deps << ['mini_portile2', '~> 2.1']
end

##################################################SETUP ZONE############################################################

desc 'Run setup'
task :setup do
  system('setup.rb uninstall --force')
  system('setup.rb config --sysconfdir=$HOME/.youtube_dlhelper')
  system('setup.rb install')
end
