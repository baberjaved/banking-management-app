Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :accounts, only: [:show, :new, :create] do
    resources :transactions, only: [:new, :create]
  end

  root to: "accounts#show"
end
