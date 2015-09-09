# coding: utf-8
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib',
                                   'youtube_dlhelper/version.rb'))
# rubocop:disable Metrics/LineLength
# rubocop:disable SpaceInsideHashLiteralBraces
Gem::Specification.new do |spec|
  spec.name = 'youtube_dlhelper'
  spec.version = YoutubeDlhelperVersion::Version::STRING
  spec.authors = ['Sascha Manns']
  spec.email = 'samannsml@directbox.com'
  spec.summary = 'Youtube Downloadhelper and Ripper'
  spec.description = 'This is a Youtube Downloadhelper who downloads a file, rips it to mp3 and placed it in a organized form'
  spec.homepage = 'https://github.com/saigkill/youtube_dlhelper'
  spec.licenses = ['GPL-3']
  spec.metadata = { 'issue_tracker' => 'http://saigkill-bugs.myjetbrains.com/youtrack/issues' }
  spec.extra_rdoc_files = %w(CHANGELOG.md CONTRIBUTING.md CODE_OF_CONDUCT.md LICENSE.md)
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|test|features)/})
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%w(youtube_dlhelper)) do |f|
    File.basename(f)
  end
  spec.require_paths = ['lib']
  spec.platform = Gem::Platform::RUBY
  spec.date = ENV['from'] ? Date.parse(ENV['from']) : Date.today
  spec.test_files = `git ls-files -- {test,test,features}/*`.split("\n")
  spec.post_install_message = '*** Run rake setup to finish the installation *** Please file bugreports and feature requests on: http://saigkill-bugs.myjetbrains.com/youtrack/issue'
  spec.add_runtime_dependency 'highline', '~> 1.7', '>= 1.7.3'
  spec.add_runtime_dependency 'parseconfig', '~> 1.0', '>= 1.0.6'
  spec.add_runtime_dependency 'viddl-rb', '~> 1.1', '>= 1.1.1'
  spec.add_runtime_dependency 'streamio-ffmpeg', '~> 1.0', '>= 1.0.0'
  spec.add_runtime_dependency 'rainbow', '~> 2.0', '>= 2.0.0'
  spec.add_runtime_dependency 'addressable', '~> 2.3', '>= 2.3.8'
  spec.add_runtime_dependency 'setup', '~> 5.2', '>= 5.2.0'
  spec.add_runtime_dependency 'notifier', '~> 0.5', '>= 0.5.1'
  spec.add_development_dependency 'MannsShared', '~> 0.2', '>= 0.2.0'
  spec.add_development_dependency 'scrutinizer-ocular', '~> 1.0', '>= 1.0.1'
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency 'rdoc', '~> 4.2', '>= 4.2.0'
  spec.add_development_dependency 'bundler', '~> 1.9', '>= 1.9.6'
  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7.6'
  spec.add_development_dependency 'gem-release', '~> 0.7', '>= 0.7.4'
  spec.add_development_dependency 'coveralls', '~> 0.8', '>= 0.8.1'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'rspec-core', '~> 3.3', '>= 3.3.2'
  spec.add_development_dependency 'rubocop', '~> 0.33', '>= 0.34.0'
  spec.add_development_dependency 'reek', '~> 3.3', '>= 3.3.1'
  spec.add_development_dependency 'ruby-lint', '~> 2.0', '>= 2.0.4'
  spec.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.0'
  spec.add_development_dependency 'indexer', '~> 0.3', '>= 0.3.1'
  spec.add_development_dependency 'mast', '~> 1.4', '>= 1.4.0'
end

