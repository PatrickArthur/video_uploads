Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root 'home#welcome'

  match 'home/welcome' => 'home#welcome', :via => [:get]
  resources :users, only: [:index, :show, :new, :create, :edit] do
    resources :attachments, only: [:index, :new, :create]
  end
end
