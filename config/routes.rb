Rails3BootstrapDeviseCancan::Application.routes.draw do

  devise_for :admins

 

    namespace :admin do 
       
      match '/dashboard' => "dashboard#index"
      resources :pages
     end
  root :to => "home#index"
  
end