Rails.application.routes.draw do

  devise_for :users
  get 'rooms/show'=> 'rooms#show'

  get 'users/:id'=>'users#top'

  root 'home#top'
end
