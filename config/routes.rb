Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'uikit', to: 'pages#uikit'
  get "dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :posts, only: %i[index show new create] do
    resources :reviews, only: %i[index new create]
  end

  resources :chatrooms, only: %i[show new create index] do
    resources :messages, only: :create
  end

  resources :users, only: %i[show]
end
