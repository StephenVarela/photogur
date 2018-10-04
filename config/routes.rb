Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
  get 'pictures/old_pictures' => "pictures#old_pictures", as: :old_pictures
  get 'pictures/created_in_year/:id' => "pictures#created_in_year"

  resources :pictures
  resources :users, only: [:new, :create]
  resources :sessions, only: [:index, :new, :create, :destroy]

end
