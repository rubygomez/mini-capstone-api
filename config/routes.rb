Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # get "/all_products", controller: "products", action: "all_products"
  # get "/product_id/:id", controller: "products", action: "product_id"
  get "/products", controller: "products", action: "index"
  get "/products" => "products#index"
  get "/products/:id", controller: "products", action: "show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"

  get "/images" => "images#index"
  get "/images/:id" => "images#show"
  post "/images" => "images#create"
  patch "/images" => "images#update"
  delete "/images/:id" => "images#destroy"
  

  # Defines the root path route ("/")
  # root "posts#index"
end
