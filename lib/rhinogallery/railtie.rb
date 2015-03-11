require 'rhinogallery/ability'

module Rhinogallery
  class Railtie < Rails::Railtie

    initializer "rhinoart_gallery_railtie.configure_rails_initialization" do |app|
      app.config.assets.precompile += %w(
        rhinogallery/*.js
        rhinogallery/*.css
        jquery.ui.plupload/plupload.png
        jquery.ui.plupload/loading.gif
      )

      Rhinoart::User.add_admin_role "Gallery Manager"

      Rhinoart::Menu::ContentMenu.add_item({
          icon: 'fa-icon-picture',
          link: proc{ rhinoart_gallery.galleries_path },
          label: 'rhinogallery._GALLERY',
          notification: ->{ Rhinogallery::Gallery.count }
        })

      ::Ability.send(:include, Rhinogallery::Ability)

    end

  end
end