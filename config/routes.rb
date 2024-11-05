Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root 'home#index'
end
