# -*- encoding : utf-8 -*-
module Yinxiangma
  module ClientHelper
    def yinxiangma_tags(options = {})
      html  = ""      
      api_server_url   = Yinxiangma.configuration.api_server_url
      reg_url = Yinxiangma.configuration.reg_url
      key   = options[:publisher_key] ||= Yinxiangma.configuration.publisher_key
      raise YinxiangmaError, "No publisher key specified." unless key
      error = options[:error] ||= (defined? flash ? flash[:yinxiangma_error] : "")
      token = request_token(key)
      if(token[0] != 'false')
        html << <<-EOS
          <script type='text/javascript'>
            var YinXiangMaDataString ='#{token[0]}';
          </script>
          <script type='text/javascript' 
            src='http://www.yinxiangma.com/widget/YinXiangMa.php' charset='utf-8'>
          </script>
        EOS
      elsif(token[1] == 'null key')
        html << <<-EOS
          为了使用<strong>印象码</strong>视频验证码广告系统， 你必须注册并拥有一个 KEY. <br /><a href='#{reg_url}'>点击注册</a>
        EOS
      elsif(token[1] == 'key_invalid')
        html << <<-EOS
          您的<strong>印象码</strong>插件配置有误，请检查您的配置文件！
        EOS
      end
            
      return (html.respond_to?(:html_safe) && html.html_safe) || html
    end
    
    def request_token(publisher_key)
      token_uri = Yinxiangma.configuration.api_server_url + Yinxiangma.configuration.token_url
    
      #TODO Resolve Rails depedency for request.env

      # userAgent = request.env["HTTP_USER_AGENT"] ||= "unknown"
      # ip = request.env["HTTP_REMOTE_ADDR"] ||= "127.0.0.1"
      # page = request.env["HTTP_REQUEST_URI"] ||= "Ruby Hosts"
      
      userAgent = "unknown"
      ip = "127.0.0.1"
      page = "Ruby Hosts"
      
      cookie = "YinXiangMa_Cookies"
      version = "YinXiangMa_Ruby_v0.1"
      mode = "live"
    
    
      yxm = Net::HTTP.post_form(URI.parse(token_uri), {
        "s" => publisher_key,
        "u" => userAgent,
        "i" => ip,
        "p" => page,
        "o" => cookie,
        "v" => version,
        "m" => mode
        }).body.split('+')
    
      return yxm
    end
  end
end
