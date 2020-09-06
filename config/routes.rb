Rails.application.routes.draw do
  root "home#index"
  get "/ping", to: "home#ping"
  get "/test", to: "home#test"

  devise_scope :user do
    get "/signed_in", to: "users/sessions#show"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
