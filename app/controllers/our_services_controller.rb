class OurServicesController < ApplicationController
  def index
  @ourservices = OurService.find(:all)
  end

  def new
  @ourservice = OurService.new
  end

  def create
  	@ourservice = OurService.new(params[:ourservice])
   respond_to do |format|
     if @ourservice.save
        format.html { redirect_to(@ourservice, :notice => 'ourservices was successfully created.') }
        format.xml { render :xml => @ourservice, :status => :created, :location => @ourservice}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @ourservice.errors, :status => :unprocessable_entity }
      end
   end
  end
end
