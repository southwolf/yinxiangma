# -*- encoding : utf-8 -*-
require "yinxiangma/configuration"
require "yinxiangma/client_helper"
require "yinxiangma/valid"

module Yinxiangma
  
  
  YINXIANGMA_API_SERVER_URL = 'http://www.yinxiangma.com/api/'
  YINXIANGMA_REGISTER_URL   = 'http://www.yinxiangma.com/server/register.php'
  YINXIANGMA_TOKEN_URL      = 'yzm.token.php'
  YINXIANGMA_VALID_URL      = 'yzm.valid.php'  
  YINXIANGMA_DISPLAY_MODE   = 'live'
  YINXIANGMA_PUBLISHER_KEY  = 'cb9d0fe8dabdea89019d845be3059973'
  
  SKIP_VALID_ENV = 'test'
  

  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    config = configuration
    yield(config)
  end
    
  class YinxiangmaError < StandardError
  end
end

if defined?(Rails)
  require "yinxiangma/rails"
end
