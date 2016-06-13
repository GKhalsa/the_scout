Rails.application.routes.draw do
  root 'welcome#index'

  get "/auth/amazon", as: :amazon_login
  get "/auth/amazon/callback", to: "sessions#create"

  get "/margin", to: "margin#index", as: :margin
  get "/profit", to: "profit#index", as: :profit
  get "/salesrank", to: "salesrank#index", as: :salesrank
end
