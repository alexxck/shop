class ImagesController < ApplicationController
  before_action :set_product

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @product.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @product.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def add_more_images(new_images)
    images = @product.images
    images += new_images
    @product.images = images
  end

  def remove_image_at_index(index)
    remain_images = @product.images
    deleted_image = remain_images.delete_at(index)
    deleted_image.try(:remove!)
    @product.images = remain_images
  end

  def images_params
    params.require(:product).permit({images: []})
  end
end