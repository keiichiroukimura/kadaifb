Rails.application.routes.draw do
  get '', to: 'users#new'
    resources :feeds do
      collection do
      post :confirm
      end
    end
  resources :users,only:[:new, :create, :show]
  resources :sessions
end
