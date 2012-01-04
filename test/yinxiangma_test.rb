# -*- encoding : utf-8 -*-
require 'test/unit'
require 'net/http'

require File.dirname(File.expand_path(__FILE__)) + '/../lib/yinxiangma'

class YinxiangmaClientHelperTest < Test::Unit::TestCase
  include Yinxiangma
  include Yinxiangma::ClientHelper
  
  def setup
    Yinxiangma.configure do |config|
      config.publisher_key = 'cb9d0fe8dabdea89019d845be3059973'
    end
  end
    
  # def test_yinxiangma_request_token_with_null_key
  #   assert_match /null key/, request_token('')[1]
  # end
  # 
  # def test_yinxiangma_request_token_with_invalid_key
  #   assert_match /key_invalid/, request_token('123456')[1]
  # end
  # 
  # def test_yinxiangma_request_token_with_valid_key
  #   assert_match /^\{\"token\":\"[0-9a-f]{32}\"/, request_token('cb9d0fe8dabdea89019d845be3059973')[0]
  # end
  
  def test_yinxiangma_tags_with_null_key
    assert_raise YinxiangmaError do
      Yinxiangma.configuration.publisher_key = nil      
      assert_match /你必须注册并拥有一个 KEY/, yinxiangma_tags()
    end
  end
  
  def test_yinxiangma_tags_with_invalid_key
    Yinxiangma.configuration.publisher_key = '123456'      
    assert_match /请检查您的配置文件/, yinxiangma_tags()
  end
  
  def test_yinxiangma_tags_with_default_key
    assert_match /var YinXiangMaDataString ='{\"token\":\"[0-9a-f]{32}\"/, yinxiangma_tags()
  end
end
