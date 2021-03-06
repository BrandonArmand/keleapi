Gem::Specification.new do |s|
    s.name          = 'kele'
    s.version       = '0.0.1'
    s.date          = '2017-10-19'
    s.summary       = 'Kele API Client'
    s.description   = 'A client for the Bloc API'
    s.authors       = ['Brandon Armand']
    s.email         = 'contact@brandonarmand.com'
    s.files         = ['lib/kele.rb', 'lib/roadmap.rb', 'lib/messages.rb', 'lib/submission.rb']
    s.require_paths = ["lib"]
    s.homepage      =
     'http://rubygems.org/gems/kele'
    s.license       = 'MIT'
    s.add_runtime_dependency ['httparty', '~> 0.13', "gem 'json', '~> 1.8', '>= 1.8.3'"]
end