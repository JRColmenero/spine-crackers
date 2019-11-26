Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'games#index'
  get 'games/userpage'
  get 'games/quiz'
  get 'games/question'

  resources :player
  resources :questions

  resources :games do
    collection do
      get :correct_answer
      get :wrong_answer
      get :game_end
    end
  end


end
