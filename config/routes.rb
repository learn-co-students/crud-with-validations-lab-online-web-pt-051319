Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  #this basically creates this:
  #resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
