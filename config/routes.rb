Rails3BootstrapDeviseCancan::Application.routes.draw do

<<<<<<< HEAD
  get "pages/index"

  get "pages/new"

  get "pages/edit"

  get "pages/create"

  get "pages/update"

  get "pages/show"

  get "pages/destroy"

#resource :sitemaps, :only => :show


=======
  

  get "industries/index"

  get "industries/new"

  get "industries/create"

  get "terms_and_condition/index"

  get "terms_and_condition/new"

  get "terms_and_condition/create"

  get "aboutus/index"

  get "aboutus/new"

  get "aboutus/create"

  get "contact_us/index"

  get "contact_us/new"

  get "contact_us/create"
>>>>>>> 56d37eaaa702f98ddd32f4c932af631c6db8673c

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins

    
    namespace :admin do 
       
      match '/dashboard' => "dashboard#index"
      
      resources :pages
     end
  root :to => "home#index"
<<<<<<< HEAD
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

=======

   resources :contacts
  match '/contact' => 'home#contact'
  match '/about_us' => 'home#about'
 
  

  match '/contact_us' => 'home#contact_us'
  match '/aboutus' => 'home#about_us'
  match '/terms_and_condition' => 'home#terms_and_condition'
  match '/industries' => 'home#industries'

end
>>>>>>> 56d37eaaa702f98ddd32f4c932af631c6db8673c
