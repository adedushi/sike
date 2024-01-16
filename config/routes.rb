Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  post 'api/test', to: 'application#test'
  
  namespace :api, defaults: {format: :json} do
      resources :users, only: [:create]
      resources :users, only: [] do
        collection do
          get 'check_email', to: 'users#check_email'
        end
      end
      resources :products, only: [:show]
      resource :session, only: [:create, :show, :destroy]
  end
  
end
