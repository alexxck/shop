# frozen_string_literal: true

class Backoffice::ProductsController < Backoffice::BackofficeController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :check_admin

  def index
    # @products = Product.order(:created_at).page(params[:page])
    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 9)
                else
                  Product.order(:created_at).page(params[:page])
                end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, url: admin_products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin: @product
      flash[:notice] = 'Product has been edited'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_admin
    redirect_to root_path unless current_user&.admin
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :price, {images: []})
  end
end
