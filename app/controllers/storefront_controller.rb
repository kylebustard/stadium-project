class StorefrontController < ApplicationController

  def index
  	@vendors = Vendor.all
  end

end
