module Rhinogallery
  module Ability
    extend ActiveSupport::Concern

    included do
      alias_method_chain :initialize, :rhinogallery
    end

    def initialize_with_rhinogallery(user)

      user ||= Rhinoart::User.new
      initialize_without_rhinogallery(user)

      return if !user.approved? or !user.admin?

      if user.has_admin_role?(Rhinoart::User::ADMIN_PANEL_ROLE_GALLERY_MANAGER)
        can :manage, Rhinogallery::Gallery
        can :manage, Rhinogallery::Image
      end

    end
  end
end