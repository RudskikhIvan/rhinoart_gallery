# encoding: utf-8
module Rhinogallery

  class ImageUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :large do
      process Rhinogallery.image_large_process
    end

    version :thumb do
      process Rhinogallery.image_thumb_process
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

  end

end
