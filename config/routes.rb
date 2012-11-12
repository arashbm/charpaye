Charpaye::Application.routes.draw do
  resources :posts do
    resources :reviews, except: [ :new, :edit ]
  end
  root to: "posts#index"

  devise_for :users
end
