Rails.application.routes.draw do

  devise_for :user
  get 'rooms/:id'=> 'rooms#show'

  get 'users/:id'=>'users#top'

  root 'home#top'
end
