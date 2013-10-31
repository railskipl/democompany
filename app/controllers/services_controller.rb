class ServicesController < ApplicationController
  def index
  	@services = Service.find(:all)
  end

  def new
  	 @service = Service.new
  end

  def create
  	@service =  Service.new(params[:service])
   respond_to do |format|
     if @service.save
        format.html { redirect_to(@service, :notice => 'service was successfully created.') }
        format.xml { render :xml => @service, :status => :created, :location => @service}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @service.errors, :status => :unprocessable_entity }
      end
   end
  end
end
