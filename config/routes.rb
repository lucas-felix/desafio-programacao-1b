Rails.application.routes.draw do
  root 'purchases#new'

  resources :purchases do
    collection { post :import }
  end
  get 'purchases/recent/:quantity' => 'purchases#recent', as: 'recent'

end
