Rails.application.routes.draw do

  get '/rooms/show'=> 'rooms#show'

  devise_for :users
  get 'home/show'=>'home#show'
  root 'home#top'


end
