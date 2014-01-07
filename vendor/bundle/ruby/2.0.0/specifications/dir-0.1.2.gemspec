# -*- encoding: utf-8 -*-
# stub: dir 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dir"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Carel Jonkhout"]
  s.date = "2010-06-27"
  s.description = "The dir gem overrides the Dir#entries and Dir#foreach methods to exclude the \"..\" and \".\" entries."
  s.email = "carel.jonkhout@gmail.com"
  s.extra_rdoc_files = ["README", "lib/dir.rb"]
  s.files = ["README", "lib/dir.rb"]
  s.homepage = "http://github.com/careljonkhout/dir"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Dir", "--main", "README"]
  s.rubyforge_project = "dir"
  s.rubygems_version = "2.2.1"
  s.summary = "The dir gem overrides the Dir#entries and Dir#foreach methods to exclude the \"..\" and \".\" entries."

  s.installed_by_version = "2.2.1" if s.respond_to? :installed_by_version
end
