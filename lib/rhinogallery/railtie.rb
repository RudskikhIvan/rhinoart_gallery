require 'rhinogallery/ability'

module Rhinogallery
  class Railtie < Rails::Railtie

    initializer "rhinoart_gallery_railtie.configure_rails_initialization" do |app|
      app.config.assets.precompile += %w(
        rhinogallery/*.js
        rhinogallery/*.css
        jquery.ui.plupload/plupload.png
        jquery.ui.plupload/loading.gif
        lightbox.js
        lightbox.css
        lightbox/*.png
        lightbox/*.gif
      )
    end

  end
end