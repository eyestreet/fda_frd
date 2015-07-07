# -*- encoding: utf-8 -*-
# stub: mongoid-fixture_set 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-fixture_set"
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Geoffroy Planquart"]
  s.date = "2015-01-23"
  s.description = "Let you use fixtures with Mongoid the same way you did with ActiveRecord"
  s.email = ["geoffroy@planquart.fr"]
  s.homepage = "https://github.com/Aethelflaed/mongoid-fixture_set"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Fixtures for Mongoid"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["~> 4.0"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.0"])
    else
      s.add_dependency(%q<mongoid>, ["~> 4.0"])
      s.add_dependency(%q<activesupport>, ["~> 4.0"])
    end
  else
    s.add_dependency(%q<mongoid>, ["~> 4.0"])
    s.add_dependency(%q<activesupport>, ["~> 4.0"])
  end
end
