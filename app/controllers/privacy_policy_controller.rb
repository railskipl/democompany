class PrivacyPolicyController < ApplicationController
  def index
  	@privacypolicy = PrivacyPolicy.find(:all)
  end

  def new
  	@privacypolicy = PrivacyPolicy.new
  end

  def create
  	@privacypolicy = PrivacyPolicy.new(params[:privacypolicy])
   respond_to do |format|
     if @privacypolicy.save
        format.html { redirect_to(@privacypolicy, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @privacypolicy, :status => :created, :location => @privacypolicy}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @privacypolicy.errors, :status => :unprocessable_entity }
      end
   end
  end
end
