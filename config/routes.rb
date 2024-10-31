Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users do
      patch :update_role, on: :member
    end
    resources :error_reports
  end
end
