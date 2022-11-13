# frozen_string_literal: true

Rails.application.routes.draw do
  root 'page#home'
  devise_for :users
  get 'page/change'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
