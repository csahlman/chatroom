Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do 
    controller :sessions do 
      get 'sign_in' => :new
      post 'sign_in' => :create
      delete 'sign_out' => :destroy
    end

    resources :users, only: [ :create ]
  end
end
