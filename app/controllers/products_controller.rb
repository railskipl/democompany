class ProductsController < ApplicationController
  def index
    @products = Product.find(:all)
  end

  def new
  	 @product = Product.new
  end

  def create
  	@product =  Product.new(params[:product])
   respond_to do |format|
     if @product.save
        format.html { redirect_to(@product, :notice => 'product was successfully created.') }
        format.xml { render :xml => @product, :status => :created, :location => @product}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @product.errors, :status => :unprocessable_entity }
      end
   end
  end
end

