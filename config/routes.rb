Rails.application.routes.draw do
  get 'tweets/index'
  resources :tweets, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
end
end
