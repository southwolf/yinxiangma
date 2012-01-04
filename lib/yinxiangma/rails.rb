# -*- encoding : utf-8 -*-
require 'net/http'
require 'yinxiangma'

ActionView::Base.send(:include, Yinxiangma::ClientHelper)
ActionController::Base.send(:include, Yinxiangma::Valid)
