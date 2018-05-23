Rails.application.routes.draw do

  post '/graphql', to: 'graphql#execute'   # Graphql POST запросы-
  get '/graphql', to: 'graphql#execute'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  scope module: 'api' do
    namespace :v1 do
      resources :jobs do
        resources :applies
        match "geeks", to: "geeks#index", via: :get
      end
      resources :companies do
        resources :jobs
        match "geeks", to: "geeks#index", via: :get
        match "applies", to: "applies#index", via: :get
      end
      resources :applies
      resources :geeks do
        resources :applies
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
