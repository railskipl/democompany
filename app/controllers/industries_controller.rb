class IndustriesController < ApplicationController
  def index
<<<<<<< HEAD
  	 @industries = Industries.find(:all)
  end

  def new
  	@industries = Industries.new
  end

  def create
  	@industries =Industries.new(params[:industries])
   respond_to do |format|
     if @industries.save
        format.html { redirect_to(@industries, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @industries, :status => :created, :location => @industries}
=======
    @industries = Industries.find(:all)
  end

  def new
        @industries = Industries.new
  end

  def create
     @industries = Industries.new(params[:aboutus])
   respond_to do |format|
     if @industries.save
        format.html { redirect_to(@industries, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @industries, :status => :created, :location => @industries }
>>>>>>> 56d37eaaa702f98ddd32f4c932af631c6db8673c
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @industries.errors, :status => :unprocessable_entity }
      end
   end
  end
end
