Jboard::Application.routes.draw do
  resources :jobs

  get "home/index"

  resource :user_session
  resources :users
  
    match '/dashboard', :to => "jobs#dashboard", :as => "dashboard"
    match '/register/:activation_code', :to => 'activations#new' ,:as => "register"
    match '/activate/:id', :to => 'activations#create', :as => "activate"
    match '/signup', :to => 'users#new', :as => "signup"
    match '/login', :to => 'user_sessions#new', :as => "login"
    match '/logout', :to => 'user_sessions#destroy', :as => "logout"
    match '/myaccount/:id', :to =>'users#edit', :as => "myaccount"
  
   
   root :to => "jobs#index"
 
   match ':controller(/:action(/:id(.:format)))'
end
