# -*- encoding: utf-8 -*-
# stub: viddl-rb 0.87 ruby lib

Gem::Specification.new do |s|
  s.name = "viddl-rb"
  s.version = "0.87"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marc Seeger"]
  s.date = "2013-10-10"
  s.description = "An extendable commandline video downloader for flash video sites. Includes plugins for vimeo, youtube, dailymotion and more"
  s.email = "mail@marc-seeger.de"
  s.executables = ["viddl-rb"]
  s.files = ["bin/viddl-rb"]
  s.homepage = "https://github.com/rb2k/viddl-rb"
  s.require_paths = ["lib"]
  s.rubyforge_project = "viddl-rb"
  s.rubygems_version = "2.1.11"
  s.summary = "An extendable commandline video downloader for flash video sites."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.5.0"])
      s.add_runtime_dependency(%q<mechanize>, [">= 0"])
      s.add_runtime_dependency(%q<progressbar>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rest-client>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
      s.add_dependency(%q<mechanize>, [">= 0"])
      s.add_dependency(%q<progressbar>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.5.0"])
    s.add_dependency(%q<mechanize>, [">= 0"])
    s.add_dependency(%q<progressbar>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
