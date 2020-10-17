Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"
  resources :books do
    resources :introduces
    resources :acts 
    collection do
      get 'category'
    end
    collection do 
      get 'search'
    end
  end
  
  resources :users, only: :show do
    collection do
      get "book"
    end
  end

  resources :conducts, only: :index
end
