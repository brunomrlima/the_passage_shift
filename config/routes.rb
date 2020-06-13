Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    devise_scope :user do
      root to: 'devise/registrations#edit', as: :authenticated_root
    end
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
