module RhinoartGallery
  module Ability
    extend ActiveSupport::Concern

    included do
      alias_method_chain :initialize, :rhinoart_gallery
    end

    def initialize_with_rhinoart_gallery(user)

      user ||= Rhinoart::User.new
      initialize_without_rhinoart_gallery(user)

      return if !user.approved? or !user.admin?

      if user.has_admin_role?(Rhinoart::User::ADMIN_PANEL_ROLE_GALLERY_MANAGER)
        can :manage, RhinoartGallery::Gallery
        can :manage, RhinoartGallery::Image
      end

    end
  end
end