Rails.application.routes.draw do
  # root 'margin#index'
  root 'signup#index'

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

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "/profitable_items", to: "profitable_items#index"
    end
  end

  get ":type/:page_num", to: "welcome#index", as: :page
end
