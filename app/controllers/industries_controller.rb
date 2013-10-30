class IndustriesController < ApplicationController
  def index
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
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @industries.errors, :status => :unprocessable_entity }
      end
   end
  end
end
