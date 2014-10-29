Rails.application.routes.draw do
  namespace :admin do
    resources :news
    resources :users
    resources :login_histories
    resources :exchanges
    resources :gift_items
    resources :kitty_words
    resources :kitties
    resources :level_up_histories
    resources :question_answers
    resources :probabilities, only: [:show, :edit, :update]
    resources :common_question_answers
  end
end
