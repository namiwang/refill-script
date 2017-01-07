require_relative 'lib/refill/version'

Gem::Specification.new do |s|
  s.name        = 'refill_script'
  s.version     = Refill::VERSION
  s.summary     = "Another cup of coffee-script."
  s.authors     = ["Nano WANG"]
  s.email       = 'namiheike@gamil.com'
  s.homepage    = 'http://github.com/refill-script/refill-script'
  s.license     = 'MIT'

  s.files       = Dir['lib/**/*.rb','exe/*']

  s.bindir = 'exe'
  s.executables = ['refill']

  s.add_runtime_dependency 'rltk'
  # s.add_runtime_dependency 'thor'
end
