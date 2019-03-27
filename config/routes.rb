Rails.application.routes.draw do
  get '', to: 'users#new'
  resources :feeds do
    collection do
      post :confirm
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only:[:new, :create, :show]
  resources :sessions
end
