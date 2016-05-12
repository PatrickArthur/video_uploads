Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root 'home#welcome'

  match 'home/welcome' => 'home#welcome', :via => [:get]
  resources :users, only: [:index] do
    resources :attachments, only: [:index, :new, :create]
  end

  resources :profiles, only: [:index, :new, :create, :show, :destroy]


 namespace :api do
   resources :profiles, :except => [:new, :create, :edit, :update, :show, :destroy] do
     member do
       post 'post_inputs'
       get 'post_outputs'
       get 'profile_posts'
       delete 'destroy_posts'
     end
   end
   resources :posts, only: [:destroy]
 end
end
