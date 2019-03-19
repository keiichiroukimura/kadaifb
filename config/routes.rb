Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only:[:new, :create, :show]
  resources :sessions
end
