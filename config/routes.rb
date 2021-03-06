Rails.application.routes.draw do
  root 'purchases#new'

  resources :purchases, only: [:new] do
    collection { post :import }
  end
  get 'purchases/recent/:quantity' => 'purchases#recent', as: 'recent'

end
