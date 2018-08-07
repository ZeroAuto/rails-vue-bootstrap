Rails.application.routes.draw do
  get 'players/index'
  root to: 'players#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => { :format => 'json' } do
    resources :players, only: [:index]
    resources :filters, only: [:index, :create]
  end
end
