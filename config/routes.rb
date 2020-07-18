Rails.application.routes.draw do
  get 'work_events/index'
  devise_for :users
  authenticated :user do
    devise_scope :user do
      root to: 'availabilities#index', as: :authenticated_root
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
  resources :work_events, only: [:index, :create, :edit, :update] do
    collection do
      get :open_modal
    end
  end
end
