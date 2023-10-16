Rails.application.routes.draw do
root to: 'rooms#search'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }
  resources :users, only: [:update]
  get "users/profile" => "users#show"
  get "users/editprofile" => "users#edit"
  
  resources :rooms do
    collection do
      get 'search'
      get 'searchindex'
      get 'searcharea'
    end
  end

  resources :reservations, only: [:index, :create ] do
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
