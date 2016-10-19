Rails.application.routes.draw do
  root 'welcome#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'auth/:provider/callback' => 'sessions#callback'	
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
