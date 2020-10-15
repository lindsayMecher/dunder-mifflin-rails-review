Rails.application.routes.draw do
  resources :dogs
  resources :employees

  post '/dogs/sorted', to: "dogs#sort_dogs", as: "sort"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
