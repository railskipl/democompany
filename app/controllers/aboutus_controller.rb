class AboutusController < ApplicationController
  def index
    @aboutus = AboutUs.find(:all)
  end

  def new
    @aboutus = AboutUs.new
  end

  def create
    @aboutus = AboutUs.new(params[:aboutus])
   respond_to do |format|
     if @aboutus.save
        format.html { redirect_to(@aboutus, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @aboutus, :status => :created, :location => @aboutus }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @aboutus.errors, :status => :unprocessable_entity }
      end
   end
  end
end
