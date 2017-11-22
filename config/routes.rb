Rails.application.routes.draw do
  resources :gold_purchases
  resources :courses
  resources :purchases
  post 'auth/login' => 'user_token#create'
  post 'auth/register' => 'users#create'
  get 'auth/user' => 'users#show'
  get 'auth/refresh' => 'users#refresh_token'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :quizzes do
    resources :questions, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
