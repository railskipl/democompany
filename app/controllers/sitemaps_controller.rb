class SitemapsController < ApplicationController
  respond_to :xml
  caches_page :show

  
  # def show
  	
  #   @other_routes = ['    about_us    ',
  #                  '      contact_us  ',
  #                  '      terms       ',
  #                  '      industries  ',
  #                  '      products    ',
  #                  '      services    ',
  #                  '      careers     ',
  #                  '      blogs       ',
  #                  '      our_services  ',
  #                  '      privacy_policy  ']
  #   respond_to do |format|
  #     format.html
  #     format.xml
  #   end

  # end
end





# To be writen in show.html.erb
# <% @other_routes.each do |route| %>
# <%= route %>
# <% end %>