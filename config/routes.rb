Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registrations" }
  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/about'

  get 'static_pages/hours'  

  get 'static_pages/how_it_works' 
  
  get 'static_pages/faqs'    

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page' 

  root 'static_pages#landing_page'

  post 'static_pages/thank_you'

  post 'payments/create'

  post 'payments/thank_you'

  # Actioncable
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
