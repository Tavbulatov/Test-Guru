# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: %i[index show] do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true, only: :show
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: %i[index destroy]
    resources :badges
  end
end
