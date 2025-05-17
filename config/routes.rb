Rails.application.routes.draw do
  resources :budgetts
  get "budgets/index"
  get "budgets/show"
  get "budgets/new"
  get "budgets/create"
  get "budgets/edit"
  get "budgets/update"
  get "budgets/destroy"
  resources :investments
  resources :incomes
  resources :expenses
  resources :categories
  resources :accounts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/login', to: 'auth#login'
  # post '/login', to: 'sessions#create'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/signup', to: 'users#create'

  get '/users', to: 'users#index'

  # Accounts routes
  get '/accounts', to: 'accounts#index'  # For listing all accounts
  post '/accounts', to: 'accounts#create' # For creating a new account
  delete '/accounts/:id', to: 'accounts#destroy'
  put '/accounts/:id', to: 'accounts#update' # For updating an account
  
  # Categories routes
  get '/categories', to: 'categories#index' # For listing all categories
  post '/categories', to: 'categories#create' # For creating a new category
  put '/categories/:id', to: 'categories#update' # For updating a category

  # Expenses routes
  post '/expenses', to: 'expenses#create' # For creating a new expense
  delete '/expenses/:id', to: 'expenses#destroy'
  put '/expenses/:id', to: 'expenses#update' # For updating an expense
  
  # Incomes routes
  post '/incomes', to: 'incomes#create' # For creating a new income

  # Investments routes
  post '/investments', to: 'investments#create' # For creating a new investment

  # Transactions routes
  resources :transactions do
    collection do
      get 'by_account/:account_id', to: 'transactions#by_account'
      get 'by_category/:category_id', to: 'transactions#by_category'
    end
  end

  # Transfers routes
  resources :transfers do
    collection do
      get 'by_account/:account_id', to: 'transfers#by_account'
    end
  end

  # Any other routes you have, for example:
  # root 'home#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
