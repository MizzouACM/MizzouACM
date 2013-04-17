Mizzouacm::Application.routes.draw do
  resources :hacks


  resources :events


  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update, :hacks ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
  resources :projects

  get ':action' => 'static#:action'
end
