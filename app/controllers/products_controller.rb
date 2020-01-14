# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    # @products = Product.order(:created_at).page(params[:page])

    @products = if params[:search]
                  Product.search(params[:search]).call(page: params[:page])
                elsif params[:sort] == 'cheapest'
                  Product.all.cheapest.call(page: params[:page])
                elsif params[:sort] == 'expensive'
                  Product.all.expensive.call(page: params[:page])
                elsif params[:sort] == 'newest'
                  Product.all.expensive.call(page: params[:page])
                elsif params[:sort] == 'oldest'
                  Product.all.expensive.call(page: params[:page])
                else
                  Product.order(:created_at).page(params[:page])
                end
    @random_product = @products.sample
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id)
  end
end
