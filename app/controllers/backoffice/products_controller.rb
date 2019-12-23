# frozen_string_literal: true

class Backoffice::ProductsController < BackofficeController
  before_action :find_product, except: %i[new create index]

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

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin: @product
      flash[:notice] = 'Product has been created'
    else
      render :new
    end
  end

  def edit
    # @robot = Robot.find(params[:id])
  end

  def update
    # @robot = Robot.find(params[:id])
    @product.update

    redirect_to product_path(@product)
  end

  def destroy
    # @robot = Robot.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :price)
  end
end
