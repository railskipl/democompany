class HomeController < ApplicationController
  def index
   
  end

  def about_us
  	@page = Page.find(2)
  end


def contact_us
  	@page = Page.find(7)
  end

  def terms
  	@page = Page.find(8)
  end

  def privacy_policy
  	@page = Page.find(9)
  end
end
