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

module Rhinogallery
  class Engine < ::Rails::Engine
    isolate_namespace Rhinogallery

    initializer 'rhinogallery.initializer' do

      Rhinoart::User.add_admin_role "Gallery Manager"

      Rhinoart::Menu::ContentMenu.add_item({
          icon: 'fa-icon-picture',
          link: proc{ rhinogallery.galleries_path },
          label: 'rhinogallery._GALLERY',
          notification: ->{ Rhinogallery::Gallery.count }
      })

      ::Ability.send(:include, Rhinogallery::Ability)

    end

  end
end
