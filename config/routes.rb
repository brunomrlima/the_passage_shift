Rails.application.routes.draw do
  get 'static_pages/home'
  get 'work_events/index'
  devise_for :users
  authenticated :user do
    devise_scope :user do
      root to: 'static_pages#home', as: :authenticated_root
    end
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :availabilities do
    collection do
      post :update_batch
    end
  end

  resources :user_types, only: [:index] do
    collection do
      get :grant_admin
      get :revoke_admin
    end
  end

  resources :work_events do
    collection do
      get :open_modal
      get :daily_summary
    end
  end

  resources :user_events, only: [:index, :create, :destroy]

  resources :profiles, only: [:show]
end
