Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pictures#index'
  get 'pictures' => 'pictures#index'
  post 'pictures' => 'pictures#create'
  get  'pictures/new' => 'pictures#new'
  get 'pictures/old_pictures' => "pictures#old_pictures", as: :old_pictures
  get 'pictures/created_in_year/:id' => "pictures#created_in_year"
  get 'pictures/:id' => 'pictures#show'
  patch 'pictures/:id' => "pictures#update"
  delete 'pictures/:id' => 'pictures#destroy'

  get 'pictures/:id/edit' => "pictures#edit"


end
