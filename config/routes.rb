Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, except: [:show] do 
    collection do 
      get :export_csv
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
