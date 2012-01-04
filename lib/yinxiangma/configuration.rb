# -*- encoding : utf-8 -*-
module Yinxiangma
  class Configuration
    attr_accessor :api_server_url,
                  :token_url,
                  :valid_url,
                  :reg_url,
                  :skip_valid_env,
                  :publisher_key,
                  :mode
    
    def initialize
      @api_server_url = YINXIANGMA_API_SERVER_URL
      @token_url      = YINXIANGMA_TOKEN_URL
      @valid_url      = YINXIANGMA_VALID_URL
      @skip_valid_env = SKIP_VALID_ENV
      @reg_url        = YINXIANGMA_REGISTER_URL

      @publisher_key  = ENV['YINXIANGMA_PUBLISHER_KEY']
      @mode           = ENV['YINXIANGMA_DISPLAY_MODE'] ||= YINXIANGMA_DISPLAY_MODE
    end
    
  end
end
