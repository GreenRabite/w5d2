Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :subs, except: [:destroy] do
    resources :posts, except: [:index]
  end


  resources :posts, only: [:edit, :update, :destroy]
end
