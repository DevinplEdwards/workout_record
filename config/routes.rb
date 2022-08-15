Rails.application.routes.draw do
  resources :exercises do
    resources :entries
  end


  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #set root path
  root "dashboard#dashboard"
end
