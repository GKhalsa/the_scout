Rails.application.routes.draw do
  root 'welcome#index'

  get "/auth/amazon", as: :amazon_login
  get "/auth/amazon/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get "/margin", to: "margin#index", as: :margin
  get "/profit", to: "profit#index", as: :profit
  get "/salesrank", to: "salesrank#index", as: :salesrank

  post "/saved_item", to: "saved_item#create", as: :saved_item
  get "/saved", to: "saved_item#index", as: :saved_items
  delete "/saved_item", to: "saved_item#destroy", as: :delete_saved_item

  get "/csv", to: "csv#index", as: :csv
end
