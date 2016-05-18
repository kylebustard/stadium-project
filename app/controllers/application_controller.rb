class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def products_by_vendor
   @vendor = Vendor.find(params[:vendor_id])
   @products = Product.all 
   @products_by_vendor = [] 

   @products.each do |product| 
   if product.vendor.id == params[:vendor_id].to_i 
    @products_by_vendor.push(product)
     end 
   end 

  end
end
