Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resource :find, only: [:show, :index], :controller => 'find'
      end

      namespace :items do
        resource :find, only: [:show, :index], :controller => 'find'
      end

      resources :merchants, only: [:index, :show, :create, :update, :destroy]
      resources :items, only: [:index, :show, :create, :update, :destroy]

      scope module: :merchants do
        resources :items do
          resource :merchant, only: [:show], :controller => 'search'
        end
      end

      scope module: :items do
        resources :merchants do
          resource :items, only: [:show], :controller => 'search'
        end
      end
    end
  end
end
