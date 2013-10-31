class TermsController < ApplicationController
  def index
    @terms = Term.find(:all)
  end

  def new
  	 @term = Term.new
  end

  def create
  	@term = Term.new(params[:term])
   respond_to do |format|
     if @term.save
        format.html { redirect_to(@term, :notice => 'contacts was successfully created.') }
        format.xml { render :xml => @term, :status => :created, :location => @term}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @term.errors, :status => :unprocessable_entity }
      end
   end
  end
end
