Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchases
  end
  resources :items, only: :show
end

# Rails.application.routes.draw do
#   devise_for :users
#   resources :items do
#     member do
#       get 'purchase', to: 'purchases#index'
#     end
#   end
#   root to: 'items#index'
# end
