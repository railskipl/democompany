class Admin::PagesController < ApplicationController
  
  layout 'admin'

  def index
   @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def edit 
    page = Page.find(params[:id]) 
  end

  def create 
    @page = Page.new(params[:page])
    if @page.save 
      flash[:notice] = "Pages created sucessfully" 
      redirect_to admin_pages_path 
    end
  end

  def update
  end

  def show 
    @pages = Page.find(params[:id])
  end

  def destroy 
    @page = Page.find(params[:id]) 

    if @page.destory 
      flash[:notice] = "Pages deleted sucessfully"
      redirect_to admin_pages_path 
    end 
    
  end
end
