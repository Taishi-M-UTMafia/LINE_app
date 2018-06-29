Rails.application.routes.draw do

  get '/rooms/show'=> 'rooms#show'

  root 'home#top'

end
