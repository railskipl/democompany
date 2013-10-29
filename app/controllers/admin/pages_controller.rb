class Admin::PagesController < ApplicationController
  
  layout 'admin'

  def index

   @pages = Page.order("created_at DESC")
  end

  def new
    @page = Page.new
  end

  def edit 
    @page = Page.find(params[:id]) 
  end

  def create 
    @page = Page.new(params[:page])
    if @page.save 
     redirect_to admin_pages_path, notice: "The page has been successfully created."
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to pages_path, notice: "The page has been successfully updated."
    else
      render action: "edit"
    end
  end

  def show 
    @pages = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])

    @page.destroy
    redirect_to admin_pages_path, notice: "The page has been successfully deleted."
  end


  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
