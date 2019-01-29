Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'

  get 'styles/atoms'

  get 'styles/molecules'

  get 'styles/organisms'

  get 'login', to: 'users#new'

  get 'signup', to: 'sessions#new'

  resources :sessions, only: %i[new create]

  resources :users do
    resources :goals
  end
  resources :ideas do
    resources :comments
  end

  get 'account/ideas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
