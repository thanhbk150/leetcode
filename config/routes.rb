# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: "login", sign_out: "logout" }

  root "dashboard#index"
  resources :users

  mount Resque::Server.new, at: '/resque'

  # API
  namespace "api" do
    namespace "v1" do
      post "tokens", to: "tokens#create"

      post "short_urls/encode", to: "short_urls#encode"
      post "short_urls/decode", to: "short_urls#decode"

      get "users", to: "users#index"
      post "users/import", to: "users#import"
    end
  end

  # App
  namespace "app" do
    get "/", to: "application#index"
  end
end
