Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :merchants, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',          to: "merchant_finder#index"
          get '/find_all',      to: "merchant_finder#show"
          get '/random',        to: "merchant_random#index"
          get '/most_revenue',  to: "most_revenue#index"
          get '/most_items',    to: "most_items#index"
          get '/revenue',       to: "merchant_revenue#index"
        end

        member do
          get '/items',                           to: "merchants/items#index"
          get '/invoices',                        to: "merchants/invoices#index"
          get '/revenue',                         to: "merchants/revenue#show"
          get '/favorite_customer',               to: "merchants/favorite_customer#show"
          get '/customers_with_pending_invoices', to: "merchants/customers_with_pending_invoices#show"
        end
      end

      resources :customers, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',      to: "customer_finder#index"
          get '/find_all',  to: "customer_finder#show"
          get '/random',    to: "customer_random#index"
        end

        member do
          get '/invoices',           to: "customers/invoices#index"
          get '/transactions',       to: "customers/transactions#index"
          get '/favorite_merchant',  to: "customers/favorite_merchant#show"
        end
      end

      resources :transactions, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',      to: "transaction_finder#index"
          get '/find_all',  to: "transaction_finder#show"
          get '/random',    to: "transaction_random#index"
        end

        member do
          get '/invoice', to: "transactions/invoice#index"
        end
      end

      resources :items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',         to: "item_finder#index"
          get '/find_all',     to: "item_finder#show"
          get '/random',       to: "item_random#index"
          get '/most_revenue', to: "item_most_revenue#index"
          get '/most_items',   to: "item_most_items#show"
        end

        member do
          get '/invoice_items',  to: "items/invoice_items#index"
          get '/merchant',       to: "items/merchant#index"
          get '/best_day',       to: "items/best_day#show"
        end
      end

      resources :invoices, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',      to: "invoice_finder#index"
          get '/find_all',  to: "invoice_finder#show"
          get '/random',    to: "invoice_random#index"
        end

        member do
          get '/transactions',  to: "invoices/transactions#index"
          get '/invoice_items', to: "invoices/invoice_items#index"
          get '/items',         to: "invoices/items#index"
          get '/customer',      to: "invoices/customer#index"
          get '/merchant',      to: "invoices/merchant#index"
        end
      end

      resources :invoice_items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get '/find',      to: "invoice_item_finder#index"
          get '/find_all',  to: "invoice_item_finder#show"
          get '/random',    to: "invoice_item_random#index"
        end

        member do
          get '/invoice',    to: "invoice_items/invoice#index"
          get '/item',       to: "invoice_items/item#index"
        end
      end
    end
  end
end
