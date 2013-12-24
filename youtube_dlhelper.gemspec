# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: jeweler_test 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jeweler_test"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sascha Manns"]
  s.date = "2013-12-24"
  s.description = "TODO: longer description of your gem"
  s.email = "Sascha.Manns@directbox.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".idea/encodings.xml",
    ".idea/misc.xml",
    ".idea/modules.xml",
    ".idea/scopes/scope_settings.xml",
    ".idea/vcs.xml",
    ".idea/youtube_dlhelper.iml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/youtube_dlhelper.conf",
    "lib/youtube_dlhelper.rb",
    "lib/youtube_dlhelper/version.rb",
    "youtube_dlhelper_spec.rb"
  ]
  s.homepage = "http://github.com/saigkill/jeweler_test"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "TODO: one-line summary of your gem"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_runtime_dependency(%q<dir>, [">= 0"])
      s.add_runtime_dependency(%q<fileutils>, [">= 0"])
      s.add_runtime_dependency(%q<parseconfig>, [">= 0"])
      s.add_runtime_dependency(%q<yt_mp3>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<dir>, [">= 0"])
      s.add_dependency(%q<fileutils>, [">= 0"])
      s.add_dependency(%q<parseconfig>, [">= 0"])
      s.add_dependency(%q<yt_mp3>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0.1"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<dir>, [">= 0"])
    s.add_dependency(%q<fileutils>, [">= 0"])
    s.add_dependency(%q<parseconfig>, [">= 0"])
    s.add_dependency(%q<yt_mp3>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0.1"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

