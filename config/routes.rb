Rails.application.routes.draw do
  devise_for :users

  root 'places#index'

  resources :places, except: [:update, :edit, :destroy] do
    member do
      get :share
    end
  end

  resources :users do
    resources :share_places, only: [:index, :new, :create]
  end
end
