Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end
  
  resources :projects do
    resources :notes
  end
  root "home#index"
end
