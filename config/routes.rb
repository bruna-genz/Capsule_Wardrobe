Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#index'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
