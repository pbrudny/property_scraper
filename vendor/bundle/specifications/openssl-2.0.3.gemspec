# -*- encoding: utf-8 -*-
# stub: openssl 2.0.3 ruby lib
# stub: ext/openssl/extconf.rb

Gem::Specification.new do |s|
  s.name = "openssl"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Martin Bosslet", "SHIBATA Hiroshi", "Zachary Scott", "Kazuki Yamaguchi"]
  s.date = "2017-01-31"
  s.description = "It wraps the OpenSSL library."
  s.email = ["ruby-core@ruby-lang.org"]
  s.extensions = ["ext/openssl/extconf.rb"]
  s.extra_rdoc_files = ["CONTRIBUTING.md", "History.md", "README.md"]
  s.files = ["CONTRIBUTING.md", "History.md", "README.md", "ext/openssl/extconf.rb"]
  s.homepage = "https://www.ruby-lang.org/"
  s.licenses = ["Ruby"]
  s.rdoc_options = ["--main", "README.md"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  s.rubygems_version = "2.5.1"
  s.summary = "OpenSSL provides SSL, TLS and general purpose cryptography."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, ["~> 3.0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<test-unit>, ["~> 3.0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<test-unit>, ["~> 3.0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
  end
end
