Rails.application.routes.draw do
  devise_for :users
  root to: 'destinations#index'
  # get 'search'
  resources :destinations, only: [:new, :create, :show, :edit, :update, :destroy] do



    resources :articles, only: [:create, :index, :show]
      collection do
        get 'search'
      end

 

  end
end
