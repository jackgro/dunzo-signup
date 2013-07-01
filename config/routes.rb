Dunzo::Application.routes.draw do

  match '/thankyou', to: 'application#thankyou'
  authenticated :user do
    root :to => 'lists#show'
  end
  devise_scope :user do
    root :to => 'home#index'
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :path => 'accounts', :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member

    resources :lists
  end

  match '/:user_slug' => "lists#show", as: :username
  match '/:user_slug/lists/:list_uid' => "lists#show", as: :username_list

  resources :lists do
    resources :tasks
  end

  resources :tasks do
    collection { post :sort }
  end

end


