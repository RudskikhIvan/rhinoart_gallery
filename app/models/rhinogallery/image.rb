module Rhinogallery
  class Image < ActiveRecord::Base
    mount_uploader :image, Rhinogallery::ImageUploader

    UPDATE_AVAILABLE_ATTRIBUTES = [:name, :alt, :description, :active, :image]

    acts_as_list scope: :gallery_id
    has_paper_trail

    default_scope { order 'position' }
    scope :active, ->{ where(active: true ) }

    belongs_to :gallery, class_name: 'Rhinogallery::Gallery'
    validates :name, :length => { :in => 2..150 }
    validates :image, :gallery_id, presence: true

    def self.add_edited_fields(*fields)
      UPDATE_AVAILABLE_ATTRIBUTES.push(*fields)
    end

  end
end
