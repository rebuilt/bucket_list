Rails.application.routes.draw do
  root to: "home#index"
  scope "/:locale" do
    get "sessions/new"

    get "home/index"

    get "styleguide", to: "styles#atoms"
    get "styles/atoms"
    get "styles/molecules"
    get "styles/organisms"

    get "account/ideas"

    resources :users, only: %i[new create edit update] do
      resources :goals, only: %i[create destroy]
    end

    resources :ideas do
      resources :comments
      resources :photos, only: %i[index create]
    end

    resources :sessions, only: %i[new create destroy]

    get "login", to: "sessions#new"
    get "signup", to: "users#new"

    get "account", to: "account#edit"
    patch "account", to: "account#update"
    get "account/goals"
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
