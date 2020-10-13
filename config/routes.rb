Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"
  resources :books do
    resources :introduces
    collection do
      get 'category'
    end
    collection do 
      get 'search'
    end
  end
  
  resources :acts

end
