Rails.application.routes.draw do
  root to: 'katas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/katas/:id' => "katas#show", as: :kata
end
