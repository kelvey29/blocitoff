Rails.application.routes.draw do

  devise_for :users
  root 'users#show'
  get 'welcome' => 'welcome#index'
  
end
