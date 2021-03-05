Rails.application.routes.draw do
  mount Commontator::Engine => '/commontator'
  devise_for :users
  root to: "home#index"

  resources :posts do
    member do
      post "toggle_favorite", to: "posts#toggle_favorite"
    end
  end
  match '/about' => 'home#about', via: [:get]
  get "*missing" => redirect("/")

end
