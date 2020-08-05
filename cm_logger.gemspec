lib_dir = File.join(File.dirname(__FILE__),'lib')
$LOAD_PATH << lib_dir unless $LOAD_PATH.include?(lib_dir)

Gem::Specification.new do |s|
  s.name        = 'cm_logger'
  s.version     = '0.0.3'
  s.date        = '2020-04-09'
  s.summary     = "Log related stuff for Rails"
  s.description = "Log related stuff for Rails"
  s.authors     = ["ben"]
  s.email       = 'ben@arc.dev'
  s.files = `git ls-files`.split($/)
  s.homepage    = 'https://github.com/CodementorIO/cm_logger'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.6'

  s.add_development_dependency("rspec", ["~> 3.9.0"])
  s.add_development_dependency("sidekiq", ["~> 6.1.1"])
end