class GalleriesController < ApplicationController

  def index
    @galleries = Rhinogallery::Gallery.all
  end

  # GET /galleries/slug
  def show
    @gallery = Rhinogallery::Gallery.find(params[:id])
  end

end
