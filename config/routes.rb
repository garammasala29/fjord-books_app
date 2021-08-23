Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
