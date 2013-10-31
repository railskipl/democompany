Rails3BootstrapDeviseCancan::Application.routes.draw do

  get "pages/index"

  get "pages/new"

  get "pages/edit"

  get "pages/create"

  get "pages/update"

  get "pages/show"

  get "pages/destroy"

#resource :sitemaps, :only => :show



  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins

    
    namespace :admin do 
       
      match '/dashboard' => "dashboard#index"
      
      resources :pages
     end
  root :to => "home#index"
  match '/contact_us' => 'home#contact_us'
  match '/about_us' => 'home#about_us'
  match '/terms' => 'home#terms'
  match '/industries' => 'home#industries'
  match '/products' => 'home#products'
  match '/services' => 'home#services'
  match '/careers' => 'home#careers'
  match '/blogs' => 'home#blogs'
  match '/our_services' => 'home#our_services'
  match '/privacy_policy' => 'home#privacy_policy'
  match '/sitemaps' => 'sitemaps#show'
  match '/press_release' => 'home#press_release'

end

