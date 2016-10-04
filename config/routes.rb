Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'merchants_finder#show'
        get '/find_all', to: 'merchants_finder#index'
        get '/random', to: 'merchants_random#show'
      end
      namespace :transactions do
        get '/find', to: 'transactions_finder#show'
        get '/find_all', to: 'transactions_finder#index'
        get '/random', to: 'transactions_random#show'
      end
      namespace :customers do
        get '/find', to: 'customers_finder#show'
        get '/find_all', to: 'customers_finder#index'
        get '/random', to: 'customers_random#show'
      end
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
