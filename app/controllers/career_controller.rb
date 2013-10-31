class CareerController < ApplicationController
  def index
  	 @careers = Career.find(:all)
  end

  def new
  	 @career = Career.new
  end

  def create
  	@career =  Product.new(params[:career])
   respond_to do |format|
     if @career.save
        format.html { redirect_to(@career, :notice => 'career was successfully created.') }
        format.xml { render :xml => @career, :status => :created, :location => @career}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @career.errors, :status => :unprocessable_entity }
      end
   end
  end
end
