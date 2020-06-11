Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :businesses, only: [:index, :show, :create]
      resources :cities, only: [:index, :show]
    end
  end
end
