Rails.application.routes.draw do
    root to: 'home#index'
    
  scope '/:locale' do
    root to: 'home#index'

    get 'home/index'

    get 'account/ideas'

    get 'styles/atoms'

    get 'styles/molecules'

    get 'styles/organisms'

    get 'login', to: 'sessions#new'

    get 'signup', to: 'users#new'

    get '/account', to: 'account#edit'

    patch '/account', to: 'account#update'

    get '/account/goals', to: 'account#goals', as: 'account_goals'

    resources :sessions, only: %i[new create destroy]

    resources :users, only: %i[new create edit update] do
      resources :goals
    end

    resources :ideas do
      resources :comments
      resources :photos
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
