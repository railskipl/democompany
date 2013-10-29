class ContactUsController < ApplicationController
  def index
  	@contactus = ContactUs.find(:all)
  end

  def new
  	 @contactus = ContactUs.new
  end

  def create
  	@contactus = ContactUs.new(params[:contactus])
   respond_to do |format|
     if @contactus.save
        format.html { redirect_to(@contactus, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @contactus, :status => :created, :location => @contactus }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @contactus.errors, :status => :unprocessable_entity }
      end
   end
  end
end
