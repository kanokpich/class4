Rails.application.routes.draw do
  resources :posts
  get 'main/login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'create_fast', to: 'users#create_fast'
  get 'main' ,to: "main#main"
  post 'login',to:"main#login"
end
