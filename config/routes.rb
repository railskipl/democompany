Rails3BootstrapDeviseCancan::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins

    
    namespace :admin do 
       
      match '/dashboard' => "dashboard#index"
      resources :pages
     end
  root :to => "home#index"
   resources :contacts
  match '/contact' => 'home#contact'
  match '/about_us' => 'home#about'
 
  
end