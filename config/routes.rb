DmsTest::Application.routes.draw do

  root 'emails#new'

  resources :emails, only: [:new, :create] do
    post :original_link, on: :collection
  end
  resources :urls, only: [:index]
  resources :app, only: [:show]

end
