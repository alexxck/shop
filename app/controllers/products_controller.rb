# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    # @products = Product.order(:created_at).page(params[:page])

    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 6)
                elsif params[:sort] == 'cheapest'
                  Product.cheapest.paginate(page: params[:page], per_page: 6)
                elsif params[:sort] == 'expensive'
                  Product.expensive.paginate(page: params[:page], per_page: 6)
                elsif params[:sort] == 'newest'
                  Product.expensive.paginate(page: params[:page], per_page: 6)
                elsif params[:sort] == 'oldestgit status'
                  Product.expensive.paginate(page: params[:page], per_page: 6)
                else
                  Product.all.paginate(page: params[:page], per_page: 6)
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
