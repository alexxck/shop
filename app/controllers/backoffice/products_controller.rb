# frozen_string_literal: true

class Backoffice::ProductsController < BackofficeController
  # Оба контроллера должны иметь CRUD экшены
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
    @product = Product.create(product_params)

    redirect_to root_path(@product)
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
end
