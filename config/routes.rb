Rails.application.routes.draw do
  root :to => "friends#index"
  resources :friends


end
