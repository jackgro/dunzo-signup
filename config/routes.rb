RailsPrelaunchSignup::Application.routes.draw do

  match '/thankyou', to: 'application#thankyou'
  authenticated :user do
    root :to => 'users#show'
  end
  devise_scope :user do
    root :to => 'devise/sessions#new'
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :path => 'accounts', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  match '/:username' => "users#show", as: :username
  match '/:username/lists/:name' => "categories#show", as: :username_category
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member

    resources :categories
  end

  resources :categories do
    resources :tasks
  end

  resources :tasks

end


