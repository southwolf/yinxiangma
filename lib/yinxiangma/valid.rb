# -*- encoding : utf-8 -*-
module Yinxiangma
  module Valid
    def yinxiangma_valid
      valid_uri = "http://www.yinxiangma.com/api/yzm.valid.php"
      http = Net::HTTP
      answer, error = http.post_form(URI.parse(valid_uri), {
        "s" => "cb9d0fe8dabdea89019d845be3059973",
        "t" => params[:YinXiangMa_challenge],
        "i" => params[:YinXiangMa_response]
        }).body.split('+')
    
      if(answer == 'true')
        return true
      elsif(answer == 'false')
        return false
      end
    end
  end
end
