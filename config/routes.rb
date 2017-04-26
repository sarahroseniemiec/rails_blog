Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/" => "home#index"

resources :sessions
resources :users
resources :posts do
  resources :comments
end


end
