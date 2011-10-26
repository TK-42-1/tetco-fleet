# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "searchlogic"
  s.version = "2.4.28"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Johnson of Binary Logic"]
  s.date = "2011-02-27"
  s.description = "Searchlogic makes using ActiveRecord named scopes easier and less repetitive."
  s.email = "bjohnson@binarylogic.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/binarylogic/searchlogic"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Searchlogic makes using ActiveRecord named scopes easier and less repetitive."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.0.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.0.0"])
  end
end
