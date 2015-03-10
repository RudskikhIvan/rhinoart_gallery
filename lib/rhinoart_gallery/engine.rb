require 'haml-rails'
require 'mini_magick'
require 'carrierwave'
require 'bootstrap-sass'
require 'jquery-rails'
require 'plupload-rails'
require 'jquery-ui-rails'
require 'lodash-rails'
require 'friendly_id'
require 'acts_as_list'
require 'rhinoart'

module RhinoartGallery
  class Engine < ::Rails::Engine
    isolate_namespace RhinoartGallery

    initializer "rhinoart_gallery.init" do |app|

      Rhinoart::User::ADMIN_PANEL_ROLE_GALLERY_MANAGER = "Gallery Manager"
      Rhinoart::User::ADMIN_PANEL_ROLES << Rhinoart::User::ADMIN_PANEL_ROLE_GALLERY_MANAGER

      Rhinoart::Menu::ContentMenu.add_item({
        icon: 'fa-icon-picture',
        link: proc{ rhinoart_gallery.galleries_path },
        label: 'rhinoart_gallery._GALLERY',
        notification: ->{ RhinoartGallery::Gallery.count }
      })

    end

  end
end
