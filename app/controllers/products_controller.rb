class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @products = Product.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
