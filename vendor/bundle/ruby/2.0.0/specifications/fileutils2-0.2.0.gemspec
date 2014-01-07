# -*- encoding: utf-8 -*-
# stub: fileutils2 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fileutils2"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Trans", "Minero Aoki"]
  s.date = "2013-03-19"
  s.description = "FileUtils2 is an improved design of Ruby's built-in FileUtils library."
  s.email = ["transfire@gmail.com"]
  s.extra_rdoc_files = ["LICENSE.txt", "HISTORY.md", "README.md"]
  s.files = ["HISTORY.md", "LICENSE.txt", "README.md"]
  s.homepage = "http://rubyworks.github.com/fileutils2"
  s.licenses = ["BSD-2-Clause", "Ruby"]
  s.rubygems_version = "2.2.1"
  s.summary = "FileUtils refactored"

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<ergo>, [">= 0"])
    else
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<ergo>, [">= 0"])
    end
  else
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<ergo>, [">= 0"])
  end
end
