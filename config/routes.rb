Rails.application.routes.draw do
  # resources :notes 
  resources :subjects do
  	resources :notes 
  end
  root 'subjects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
