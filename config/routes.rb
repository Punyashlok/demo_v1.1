Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create]
  root to: 'urls#new'
  get "/:short_url", to: "urls#show", as: :url_show
end
