# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: youtube_dlhelper 0.1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "youtube_dlhelper"
  s.version = "0.1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sascha Manns"]
  s.date = "2013-12-29"
  s.description = "This is a Youtube Downloadhelper who downloads a file, rips it to mp3 and placed it in a organized form"
  s.email = "Sascha.Manns@directbox.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".coveralls.yml",
    ".gemrelease",
    ".rspec",
    ".travis.yml",
    ".yardoc/checksums",
    ".yardoc/object_types",
    ".yardoc/objects/root.dat",
    ".yardoc/proxy_types",
    ".yardopts",
    "Changelog.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "TODO.md",
    "VERSION",
    "coverage/.last_run.json",
    "coverage/.resultset.json",
    "doc/.yardoc/checksums",
    "doc/.yardoc/object_types",
    "doc/.yardoc/objects/root.dat",
    "doc/.yardoc/proxy_types",
    "doc/YoutubeDlhelper.html",
    "doc/YoutubeDlhelperLibs.html",
    "doc/YoutubeDlhelperLibs/Checker.html",
    "doc/YoutubeDlhelperLibs/Downloader.html",
    "doc/YoutubeDlhelperLibs/Import.html",
    "doc/YoutubeDlhelperLibs/Ripper.html",
    "doc/YoutubeDlhelperVersion.html",
    "doc/YoutubeDlhelperVersion/Version.html",
    "doc/_index.html",
    "doc/class_list.html",
    "doc/css/common.css",
    "doc/css/full_list.css",
    "doc/css/style.css",
    "doc/file.README.html",
    "doc/file_list.html",
    "doc/frames.html",
    "doc/index.html",
    "doc/js/app.js",
    "doc/js/full_list.js",
    "doc/js/jquery.js",
    "doc/method_list.html",
    "doc/top-level-namespace.html",
    "lib/youtube_dlhelper.rb",
    "lib/youtube_dlhelper/libs.rb",
    "lib/youtube_dlhelper/version.rb",
    "lib/youtube_dlhelper/youtube_dlhelper.conf",
    "pkg/youtube_dlhelper-0.1.2.alpha.gem",
    "spec/spec_helper.rb",
    "test/test_helper.rb",
    "youtube_dlhelper.gemspec",
    "youtube_dlhelper/.gitignore",
    "youtube_dlhelper/Gemfile",
    "youtube_dlhelper/LICENSE.txt",
    "youtube_dlhelper/README.md",
    "youtube_dlhelper/Rakefile",
    "youtube_dlhelper/lib/youtube_dlhelper.rb",
    "youtube_dlhelper/lib/youtube_dlhelper/version.rb",
    "youtube_dlhelper/youtube_dlhelper.gemspec"
  ]
  s.homepage = "https://github.com/saigkill/youtube_dlhelper"
  s.licenses = ["GPL-3"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Youtube Downloadhelper and Ripper"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_runtime_dependency(%q<dir>, [">= 0"])
      s.add_runtime_dependency(%q<fileutils>, ["~> 0.7"])
      s.add_runtime_dependency(%q<parseconfig>, [">= 0"])
      s.add_runtime_dependency(%q<viddl-rb>, [">= 0"])
      s.add_runtime_dependency(%q<streamio-ffmpeg>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<dir>, [">= 0"])
      s.add_dependency(%q<fileutils>, ["~> 0.7"])
      s.add_dependency(%q<parseconfig>, [">= 0"])
      s.add_dependency(%q<viddl-rb>, [">= 0"])
      s.add_dependency(%q<streamio-ffmpeg>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 4.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<dir>, [">= 0"])
    s.add_dependency(%q<fileutils>, ["~> 0.7"])
    s.add_dependency(%q<parseconfig>, [">= 0"])
    s.add_dependency(%q<viddl-rb>, [">= 0"])
    s.add_dependency(%q<streamio-ffmpeg>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 4.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

