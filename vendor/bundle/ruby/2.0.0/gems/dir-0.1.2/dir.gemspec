# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dir}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Carel Jonkhout"]
  s.date = %q{2010-06-27}
  s.description = %q{The dir gem overrides the Dir#entries and Dir#foreach methods to exclude the ".." and "." entries.}
  s.email = %q{carel.jonkhout@gmail.com}
  s.extra_rdoc_files = ["README", "lib/dir.rb"]
  s.files = ["README", "Rakefile", "lib/dir.rb", "Manifest", "dir.gemspec"]
  s.homepage = %q{http://github.com/careljonkhout/dir}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Dir", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dir}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The dir gem overrides the Dir#entries and Dir#foreach methods to exclude the ".." and "." entries.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
