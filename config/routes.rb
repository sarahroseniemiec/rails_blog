Rails.application.routes.draw do
  get 'comments/index'

  get 'posts/new'

  get 'posts/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/" => "home#index"

resources :sessions
resources :users
resources :posts do
  resources :comments
end


end
