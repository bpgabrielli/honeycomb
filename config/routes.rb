Honeycomb::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events, except: [:index]
    end
  end
  resources :events, only: [:index]
  match 'events' => "events#index", via: :options
  
  devise_for :users

  root to: "home#index"
end
