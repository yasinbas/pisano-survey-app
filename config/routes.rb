Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :admin do
    resources :users do
      member do
        patch :activate
        patch :deactivate
        patch :change_role
      end
    end
    resources :surveys
    resources :dashboard, only: [:index]
  end

  resources :surveys, only: [:show] do
    member do
      post :feedback
    end
  end
end

