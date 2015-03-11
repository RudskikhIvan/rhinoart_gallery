require_dependency "rhinogallery/application_controller"
module Rhinogallery
  class GalleriesController < ApplicationController
    before_action { authorize!(:manage, Rhinogallery::Gallery) }
    before_action :set_gallery, only: [:show, :edit, :update, :destroy, :load_images, :move_up, :move_down]

    # GET /galleries
    def index
      @galleries = Rhinogallery::Gallery.includes(:images).all
    end

    # GET /galleries/1
    def show
    end

    def move_up
      @gallery.move_higher
      redirect_to galleries_path
    end

    def move_down
      @gallery.move_lower
      redirect_to galleries_path
    end

    # GET /galleries/new
    def new
      @gallery = Gallery.new
    end

    # GET /galleries/1/edit
    def edit
    end

    # POST /galleries
    def create
      @gallery = Gallery.new(gallery_params)

      if @gallery.save
        redirect_to @gallery, notice: t('rhinogallery._GALLERY_SUCCESSFULLY_CREATED')
      else
        render :new
      end
    end

    # PATCH/PUT /galleries/1
    def update
      if @gallery.update(gallery_params)
        redirect_to @gallery, notice: t('rhinogallery._GALLERY_SUCCESSFULLY_UPDATED')
      else
        render :edit
      end
    end

    # DELETE /galleries/1
    def destroy
      @gallery.destroy
      redirect_to galleries_url, notice: t('rhinogallery._GALLERY_SUCCESSFULLY_UPDATED', name: @gallery.name)
    end

    def load_images

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.fetch(:gallery).permit(:name, :slug, :image, :description, :active)
    end
  end
end
