Rails.application.routes.draw do
  devise_for :users 
  root 'home#index'
  authenticated :user do
    root 'home#index', as: :authenticated_root
    resources :payment_transactions, only: [:new, :create, :index] do
      collection do
        get 'initiate_transaction'
        get 'search_bank_account'
      end
    end
  end
end
