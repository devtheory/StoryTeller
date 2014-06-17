StoryTeller::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :stories
  resources :subscriptions, only: [:new, :create, :edit, :update]
  
  devise_scope :user do
  get 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
  end

  resources :users, only: [:index, :update, :show]

  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
