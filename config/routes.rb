Rails.application.routes.draw do
  scope defaults: { format: :json } do
    devise_for :users, only: []
  end

  namespace :v1, defaults: { format: "json" } do
    devise_scope :user do
      post "users/sign_in", to: "sessions#create"
      post "users", to: "registrations#create"
    end

    resources :images, only: %i(create index show)
    resources :likes, only: %i(create destroy)
  end
end
