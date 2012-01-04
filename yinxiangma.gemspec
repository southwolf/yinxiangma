# -*- encoding: utf-8 -*-
require File.expand_path('../lib/yinxiangma/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["SouthWolf"]
  gem.email         = ["wp.southwolf@gmail.com"]
  gem.summary       = %q{Helpers for the YinXiangMa CAPTCHA API}
  gem.description   = %q{This plugin adds helpers for the YinXiangMa CAPTCHA API}
  gem.homepage      = "http://www.yinxiangma.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "yinxiangma"
  gem.require_paths = ["lib"]
  gem.version       = Yinxiangma::VERSION
  
  gem.add_development_dependency "rake"
end