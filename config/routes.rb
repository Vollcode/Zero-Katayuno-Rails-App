Rails.application.routes.draw do
  devise_for :users
  root to: 'katas#index'

  resources :katas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/katas/:id' => "katas#show", as: :kata
  # get '/new/katas' => 'katas#new', as: :new_kata
  # post '/create/katas' => 'katas#create', as: :create_katas
  # get '/edit/:id' => 'katas#edit', as: :edit_kata
  # patch 'katas/:id' => 'katas#update'
  # delete 'katas/:id' => 'katas#delete', as: :delete_kata
end
