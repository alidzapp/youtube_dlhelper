# coding: utf-8
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require File.expand_path(File.join(File.dirname(__FILE__), 'lib',
                                   'youtube_dlhelper/version.rb'))
Gem::Specification.new do |spec|
  spec.name = 'youtube_dlhelper'
  spec.version = YoutubeDlhelperVersion::Version::STRING
  spec.authors = ['Sascha Manns']
  spec.email = 'Sascha.Manns@bdvb.de'
  spec.summary = 'Youtube Downloadhelper and Ripper'
  spec.description = 'This is a Youtube Downloadhelper who downloads a file,
rips it to mp3 and placed it in a organized form'
  spec.homepage = 'https://github.com/saigkill/youtube_dlhelper'
  spec.licenses = ['GPL-3']
  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%w(youtube_dlhelper)) { |f|
    File.basename(f)
  }
  spec.require_paths = ['lib']
  spec.platform = Gem::Platform::RUBY
  spec.date = ENV['from'] ? Date.parse(ENV['from']) : Date.today
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.post_install_message = 'Please file bugreports and feature requests
on: http://saigkill.ddns.net:8112/dashboard'
  spec.add_runtime_dependency 'highline', '~> 1.7', '>= 1.7.2'
  spec.add_runtime_dependency 'dir', '~> 0.1', '>= 0.1.2'
  spec.add_runtime_dependency 'parseconfig', '~> 1.0', '>= 1.0.6'
  spec.add_runtime_dependency 'viddl-rb', '~> 1.1', '>= 1.1.1'
  spec.add_runtime_dependency 'streamio-ffmpeg', '~> 1.0', '>= 1.0.0'
  spec.add_runtime_dependency 'rainbow', '~> 2.0', '>= 2.0.0'
  spec.add_runtime_dependency 'addressable', '~> 2.3', '>= 2.3.8'
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  spec.add_development_dependency 'rdoc', '~> 4.2', '>= 4.2.0'
  spec.add_development_dependency 'bundler', '~> 1.9', '>= 1.9.6'
  spec.add_development_dependency 'yard', '~> 0.8', '>= 0.8.7.6'
  spec.add_development_dependency 'gem-release', '~> 0.7', '>= 0.7.3'
  spec.add_development_dependency 'coveralls', '~> 0.8', '>= 0.8.1'
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'rubocop', '~> 0.31', '>= 0.31.0'
  spec.add_development_dependency 'overcommit', '~> 0.24', '>= 0.24.0'
  spec.add_development_dependency 'travis', '~> 1.7', '>= 1.7.7'
  spec.add_development_dependency 'reek', '~> 2.2', '>= 2.2.1'
  spec.add_development_dependency 'ruby-lint', '~> 2.0', '>= 2.0.4'
  spec.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.0'
end

