# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "youtube_dlhelper"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sascha Manns"]
  s.date = "2014-01-13"
  s.description = "This is a Youtube Downloadhelper who downloads a file, rips it to mp3 and placed it in a organized form"
  s.email = "Sascha.Manns@directbox.com"
  s.executables = ["youtube_dlhelper"]
  s.extra_rdoc_files = [
    "LICENSE.md",
    "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
    ".bundle/install.log",
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
    "LICENSE.md",
    "README.rdoc",
    "Rakefile",
    "TODO.md",
    "VERSION",
    "bin/youtube_dlhelper",
    "circle.yml",
    "coverage/.last_run.json",
    "coverage/.resultset.json",
    "doc/Checker.html",
    "doc/Checker/Usage.html",
    "doc/Downloader.html",
    "doc/FileHelper.html",
    "doc/Import.html",
    "doc/Ripper.html",
    "doc/YoutubeDlhelper.html",
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
    "lib/coverage/.last_run.json",
    "lib/youtube_dlhelper.rb",
    "lib/youtube_dlhelper/checker.rb",
    "lib/youtube_dlhelper/downloader.rb",
    "lib/youtube_dlhelper/filehelper.rb",
    "lib/youtube_dlhelper/import_config.rb",
    "lib/youtube_dlhelper/ripper.rb",
    "lib/youtube_dlhelper/script_structure.rb",
    "lib/youtube_dlhelper/version.rb",
    "lib/youtube_dlhelper/youtube_dlhelper.conf",
    "spec/coverage/.last_run.json",
    "spec/coverage/.resultset.json",
    "spec/lib_spec.rb",
    "spec/spec_helper.rb",
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
  s.rubygems_version = "2.0.14"
  s.summary = "Youtube Downloadhelper and Ripper"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_runtime_dependency(%q<dir>, [">= 0"])
      s.add_runtime_dependency(%q<fileutils2>, [">= 0"])
      s.add_runtime_dependency(%q<parseconfig>, [">= 0"])
      s.add_runtime_dependency(%q<viddl-rb>, [">= 0"])
      s.add_runtime_dependency(%q<streamio-ffmpeg>, [">= 0"])
      s.add_runtime_dependency(%q<rainbow>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<gem-release>, [">= 0"])
    else
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<dir>, [">= 0"])
      s.add_dependency(%q<fileutils2>, [">= 0"])
      s.add_dependency(%q<parseconfig>, [">= 0"])
      s.add_dependency(%q<viddl-rb>, [">= 0"])
      s.add_dependency(%q<streamio-ffmpeg>, [">= 0"])
      s.add_dependency(%q<rainbow>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 4.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<gem-release>, [">= 0"])
    end
  else
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<dir>, [">= 0"])
    s.add_dependency(%q<fileutils2>, [">= 0"])
    s.add_dependency(%q<parseconfig>, [">= 0"])
    s.add_dependency(%q<viddl-rb>, [">= 0"])
    s.add_dependency(%q<streamio-ffmpeg>, [">= 0"])
    s.add_dependency(%q<rainbow>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 4.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<gem-release>, [">= 0"])
  end
end

