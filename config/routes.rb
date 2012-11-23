Charpaye::Application.routes.draw do
  root to: "dashboard#show"

  resources :posts do
    resources :revisions, only: [ :index, :show ]
    resources :reviews, except: [ :new, :edit ]
  end

  resource :activities
  get '/dashboard' => 'dashboard#show'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: [ :index, :show, :edit, :update ]
end
