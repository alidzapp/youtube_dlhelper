# -*- encoding: utf-8 -*-
# stub: streamio-ffmpeg 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "streamio-ffmpeg"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Backeus"]
  s.date = "2013-07-08"
  s.email = ["david@streamio.com"]
  s.homepage = "http://github.com/streamio/streamio-ffmpeg"
  s.rubygems_version = "2.2.1"
  s.summary = "Wraps ffmpeg to read metadata and transcodes videos."

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
  end
end
