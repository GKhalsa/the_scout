Rails.application.routes.draw do
  root 'welcome#index'

  get "/auth/amazon", as: :amazon_login
  get "/auth/amazon/callback", to: "sessions#create"
end
