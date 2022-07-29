Rails.application.routes.draw do
  resources :exercises
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #set root path
  root "exercises#index"

end
