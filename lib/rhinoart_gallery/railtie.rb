require "rhinoart_gallery/ability"

module RhinoartGallery
  class Railtie < Rails::Railtie
    initializer "rhinoart_gallery_railtie.configure_rails_initialization" do |app|
      app.config.assets.precompile += %w(
        rhinoart_gallery/images_uploader.js
        jquery.ui.plupload/plupload.png
        jquery.ui.plupload/loading.gif
      )
    end

    initializer "rhinoart_gallery_railtie.configure_ability" do |app|
      ::Ability.send(:include, RhinoartGallery::Ability)
    end

  end
end