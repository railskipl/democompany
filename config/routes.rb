Rails3BootstrapDeviseCancan::Application.routes.draw do

  

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
 
  

  match '/contact_us' => 'home#contact_us'
  match '/aboutus' => 'home#about_us'
  match '/terms_and_condition' => 'home#terms_and_condition'
  match '/industries' => 'home#industries'

end