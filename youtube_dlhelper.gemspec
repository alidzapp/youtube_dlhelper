# coding: utf-8
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'highline/import'
require 'dir'
require 'fileutils'
require 'parseconfig'
require 'yt_mp3'
require 'rake'

Gem::Specification.new do |spec|
  spec.name          = "youtube_dlhelper"
  spec.version       = Youtube_dlhelper::Version::STRING
  spec.authors       = ["Sascha Manns"]
  spec.email         = ["Sascha.Manns@directbox.com"]
  spec.description   = "This tool downloads a Youtube Musicvideo, reworks it to MP3 and asks for a name. Then it creates a new folder in a defined Space and moves the file to that target"
  spec.summary       = "A Youtube Downloadhelper"
  spec.homepage      = "https://github.com/saigkill/ruby_script_collection"
  spec.license       = "GPL-3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
