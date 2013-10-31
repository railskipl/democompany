class BlogController < ApplicationController
  def index
  	 @blogs = Blog.find(:all)
  end

  def new
  	 @blog = Blog.new
  end

  def create
  	@blog =  Blog.new(params[:blog])
   respond_to do |format|
     if @blog.save
        format.html { redirect_to(@blog, :notice => 'blog was successfully created.') }
        format.xml { render :xml => @blog, :status => :created, :location => @blog}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
   end
  end
end
