require_dependency "rhinogallery/application_controller"
module Rhinogallery
  class ImagesController < ApplicationController
    before_action { authorize!(:manage, Rhinogallery::Image) }
    before_action :set_image, only: [:show, :edit, :update]

    # GET /images
    def index
      @images = Image.all
    end

    # GET /images/1
    def show
    end

    # GET /images/1/edit
    def edit
    end

    # POST /images
    def create
      image_params = {
        image: params[:file],
        name: params[:name] || params[:file].original_filename,
        gallery: Rhinogallery::Gallery.find(params[:gallery_id])
      }
      @image = Image.new(image_params)
      @image.save!
      render :nothing => true
    end

    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        redirect_to gallery_path(@image.gallery), notice: t('rhinogallery._IMAGE_SUCCESSFULLY_UPDATED')
      else
        render :edit
      end
    end

    # DELETE /images/1
    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to gallery_path(@image.gallery), notice: t('rhinogallery._IMAGE_SUCCESSFULLY_DELITED', name: @image.name)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Gallery.find(params[:gallery_id]).images.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def image_params
        params.fetch(:image).permit(:name, :alt, :description, :active)
      end
  end
end
