Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :auction_items
    resources :charge_logs
    resources :pricing_plays
  end
end
