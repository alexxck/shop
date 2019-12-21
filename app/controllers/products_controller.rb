# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at).page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
end
