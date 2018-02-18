Rails.application.routes.draw do
  root "home#index"
  get  '/twitter',  to: "twitter#index"
  post '/twitter',  to: "twitter#tweet"

  get 'movies/index', to: "movies#index"
  post 'movies/search', to: "movies#search"

  get 'cryptos/index', to: "cryptos#index"
  get 'cryptos/scrap', to: "cryptos#scrap"
end
