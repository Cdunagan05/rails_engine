Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get '/find',            to: 'search#show'
        get '/find_all',        to: 'search#index'
        get '/random',          to: 'search#random'
        get "/most_revenue",    to: "most_revenue#index"
        get "/most_items",      to: "most_items#index"
        get "/revenue",         to: "revenue_date#show"
      end
      namespace :transactions do
        get '/find',            to: 'search#show'
        get '/find_all',        to: 'search#index'
        get '/random',          to: 'search#random'
      end
      namespace :customers do
        get '/find',            to: 'search#show'
        get '/find_all',        to: 'search#index'
        get '/random',          to: 'search#random'
      end
      namespace :invoice_items do
        get "/find",            to: "search#show"
        get "/find_all",        to: "search#index"
        get "/random",          to: "search#random"
      end
      namespace :invoices do
        get "/find",            to: "search#show"
        get "/find_all",        to: "search#index"
        get "/random",          to: "search#random"
      end
      namespace :items do
        get "/find",            to: "search#show"
        get "/find_all",        to: "search#index"
        get "/random",          to: "search#random"
      end
      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "transactions/invoice#show"
      end
      resources :invoices, only: [:index, :show] do
        get "/transactions",    to: "invoices/transactions#index"
        get "/invoice_items",   to: "invoices/invoice_items#index"
        get "/items",           to: "invoices/items#index"
        get "/customer",        to: "invoices/customer#show"
        get "/merchant",        to: "invoices/merchant#show"
      end
      resources :customers, only: [:index, :show] do
        get "/invoices",          to: "customers/invoices#index"
        get "/transactions",      to: "customers/transactions#index"
        get "/favorite_merchant", to: "customers/favorite_merchant#show"
      end
      resources :invoice_items, only: [:index, :show] do
        get "/invoice",         to: "invoice_items/invoice#show"
        get "/item",            to: "invoice_items/item#show"
      end
      resources :items, only: [:index, :show] do
        get "/invoice_items",   to: "items/invoice_items#index"
        get "/merchant",        to: "items/merchant#show"
      end
      resources :merchants, only: [:index, :show] do
        get "/items",                           to: "merchants/items#index"
        get "/invoices",                        to: "merchants/invoices#index"
        get "/customers_with_pending_invoices", to: "merchants/pending_invoices#index"
        get "/revenue",                         to: "merchants/revenue#show"
        get "/favorite_customer",               to: "merchants/favorite_customer#show"
      end
    end
  end
end
