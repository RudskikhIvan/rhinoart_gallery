module Rhinogallery
  class Image < ActiveRecord::Base
    mount_uploader :image, Rhinogallery::ImageUploader

    acts_as_list scope: :gallery_id
    has_paper_trail

    default_scope { order 'position' }

    belongs_to :gallery, class_name: 'Rhinogallery::Gallery'
    validates :name, :length => { :in => 2..150 }
    validates :image, :gallery_id, presence: true
  end
end
