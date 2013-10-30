class TermsAndControllerController < ApplicationController
  def index
    @terms_and_conditions = Terms_And_Condition.find(:all)
  end

  def new
     @terms_and_condition = Terms_And_Condition.new
  end

  def create
    @terms_and_condition = Terms_And_Condition.new(params[:terms_and_condition])
   respond_to do |format|
     if terms_and_condition.save
        format.html { redirect_to(terms_and_condition, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => terms_and_condition, :status => :created, :location => terms_and_condition }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => terms_and_condition.errors, :status => :unprocessable_entity }
      end
   end
  end
end
