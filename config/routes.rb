Rails.application.routes.draw do

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'

  get 'hello' => 'home#hello'

  resources :products#, :except => [:show]
  get 'list_all' => 'products#list_all'

end
