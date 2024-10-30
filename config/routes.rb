Rails.application.routes.draw do
  resources :surveys, only: [:show] do
    post :feedback, on: :member
  end
end
