class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @vendors = Vendor.all ## @vendors hosts all the vendors for the new product page(dropdown box vendors)
  end

  # GET /products/1/edit
  def edit
    @vendors = Vendor.all  ## @vendors hosts all the vendors for the edit product page(dropdown box vendors)
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :description, :vendor_id, :image)
    end
end
