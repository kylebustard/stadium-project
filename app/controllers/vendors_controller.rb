class VendorsController < ApplicationController

	before_action :set_vendor, only: [:edit, :show, :update, :destroy]

  def index
  	@vendors = Vendor.all
  end

  def products_by_vendor


  end

  def edit

  end

  def new
  	@vendor = Vendor.new
  end

  def show

  end

def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
    
      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @pvendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :image)
    end

end
