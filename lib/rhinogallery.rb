require "rhinogallery/engine"

module Rhinogallery

  def self.add_config_param(name, value = nil)
    mattr_accessor name.to_sym
    self.send("#{name}=", value)
  end

  def self.setup
    yield self
  end

  add_config_param :image_large_process, {:resize_to_fill => [800,800]}
  add_config_param :image_thumb_process, {:resize_to_fill => [160,160]}

end

require 'rhinogallery/railtie' if defined?(Rails)
