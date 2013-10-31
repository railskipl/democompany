class PressReleaseController < ApplicationController
  def index
  	@pressrelease = PressRelease.find(:all)
  end

  def new
  	 @pressrelease = PressRelease.new
  end

  def create
  	@pressrelease = PressRelease.new(params[:pressrelease])
   respond_to do |format|
     if @pressrelease.save
        format.html { redirect_to(@pressrelease, :notice => 'pressreleases was successfully created.') }
        format.xml { render :xml => @pressrelease, :status => :created, :location => @pressrelease}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @pressrelease.errors, :status => :unprocessable_entity }
      end
   end
  end
end
