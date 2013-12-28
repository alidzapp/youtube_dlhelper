# -*- encoding: utf-8 -*-
# stub: jeweler 1.8.8 ruby lib

Gem::Specification.new do |s|
  s.name = "jeweler"
  s.version = "1.8.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols", "Yusuke Murata"]
  s.date = "2013-10-08"
  s.description = "Simple and opinionated helper for creating Rubygem projects on GitHub"
  s.email = ["josh@technicalpickles.com", "info@muratayusuke.com"]
  s.executables = ["jeweler"]
  s.extra_rdoc_files = ["ChangeLog.markdown", "LICENSE.txt", "README.markdown"]
  s.files = ["bin/jeweler", "ChangeLog.markdown", "LICENSE.txt", "README.markdown"]
  s.homepage = "http://github.com/technicalpickles/jeweler"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Opinionated tool for creating and managing RubyGem projects"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<git>, [">= 1.2.5"])
      s.add_runtime_dependency(%q<nokogiri>, ["= 1.5.10"])
      s.add_runtime_dependency(%q<github_api>, ["= 0.10.1"])
      s.add_runtime_dependency(%q<highline>, [">= 1.6.15"])
      s.add_runtime_dependency(%q<bundler>, ["~> 1.0"])
      s.add_runtime_dependency(%q<rdoc>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.5"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bluecloth>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.4"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<git>, [">= 1.2.5"])
      s.add_dependency(%q<nokogiri>, ["= 1.5.10"])
      s.add_dependency(%q<github_api>, ["= 0.10.1"])
      s.add_dependency(%q<highline>, [">= 1.6.15"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<yard>, ["~> 0.8.5"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bluecloth>, [">= 0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.4"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<git>, [">= 1.2.5"])
    s.add_dependency(%q<nokogiri>, ["= 1.5.10"])
    s.add_dependency(%q<github_api>, ["= 0.10.1"])
    s.add_dependency(%q<highline>, [">= 1.6.15"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<yard>, ["~> 0.8.5"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bluecloth>, [">= 0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.4"])
  end
end
