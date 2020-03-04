Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'
  get 'select_category', to: 'posts#select_category'
  get 'show_options', to: 'combinations#show_options'
  get 'select_posts', to: 'combinations#select_posts'
  
  resources :posts
  resources :combinations

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
