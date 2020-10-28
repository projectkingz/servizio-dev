Rails.application.routes.draw do

  resources :urgencies
  root 'pages#home'

  # DASHBOARD
  get '/admins/dashboard', to: 'admins#dashboard'
  get '/trades/dashboard', to: 'trades#dashboard'
  get '/users/dashboard', to: 'users#dashboard'     ## dashboard_path
  post '/users/edit', to: 'users#edit'      ## users_edit_path
  post '/trades/edit', to: 'trades#update'
  post '/admins/edit', to: 'admins#update'


  #QUOTES
  get '/client_quotes', to: 'quotes#client_quotes'
  get '/supplier_quotes', to: 'quotes#supplier_quotes'


  #delete '/booking/:id', to: 'bookings#destroy'
  #get '/users/:id', to: 'users#show'
  #need to review this because its stopping access to user sign_in and user sign_up  , but not sure why ???
  #stopped temporarily 27.Sep.2019



  #OFFERS
  get '/offer_bookings/:id', to: 'offers#bookings', as: 'offer_bookings'
  post '/offers/:id', to: 'offers#show'
  get '/all_offers', to: 'offers#list'
  post '/offers/new', to: 'offers#create'


  ## BOOKINGS
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/bookings/:id', to: 'bookings#show'
  post '/bookings', to: 'bookings#create'
  post '/booking/new', to: 'bookings#create'
  put '/bookings/:id/edit', to: 'bookings#edit'
  put '/bookings/:id/withdraw', to: 'bookings#withdraw'
  put '/bookings/:id', to: 'bookings#withdraw'
  put '/bookings/:id/accept', to: 'bookings#accept', as: 'accept_booking'
  put '/bookings/:id/reject', to: 'bookings#reject', as: 'reject_booking'
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/bookings/:id', to: 'bookings#show'

  #REVIEWS
  post '/reviews', to: 'reviews#create'


  #LISTINGS
  get '/listings/client_listings', to: 'listings#client_listings' #listings_client_listings_path ???

  #devise_for :admins
  #devise_for :users, path: 'users'
  #devise_for :trades, path: 'trades'
  #devise_for :admins, path: 'admins'

  #get 'users/show'
  #get 'trades/show'
  #get 'admins/show'

# Devise for Users

  authenticated :users do
    # root to:'users/sessions#new', as: :authenticated_user_root
    # root to: 'users/users#dashboard', as: :authenticated_user_root
  end


  devise_for :users, path: 'users', controllers: {
      #sessions: 'users/sessions',
      # stopped calling sessions controller temporarily 21.09.19
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
      omniauth_callbacks: 'users/omniauth_callbacks'
    },
    path_names: {
      sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'
    }

    devise_scope :users do
      get 'sign_up', :to => 'users/registrations#new'
      get 'sign_in', :to => 'users/sessions#new'
      delete 'signout', :to => 'users/sessions#destroy'
    end


    # Devise for Traders

      authenticated :trades do
       #root to:'trades/sessions#new', as: :authenticated_trade_root
       root to: 'trades/trades#dashboard', as: :authenticated_trade_root
      end


      devise_for :trades, path: 'trades', controllers: {
          sessions: 'trades/sessions',
          # stopped calling sessions controller temporarily 21.09.19
          registrations: 'trades/registrations',
          passwords: 'trades/passwords',
          confirmations: 'trades/confirmations',
          #omniauth_callbacks: 'trades/omniauth_callbacks'
        },
        path_names: {
          sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'
        }

        devise_scope :trades do
          get 'signup', :to => 'trades/registrations#new'
          get 'signin', :to => 'trades/sessions#new'
          delete 'signout', :to => 'trades/sessions#destroy'
        end

# Devise for Admins

    authenticated :admins do
      root to: 'admins/sessions#new' , as: :authenticated_admin_root
    end


    devise_for :admins, path: 'admins', controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations',
        passwords: 'admins/passwords',
        confirmations: 'admins/confirmations'
      }

    devise_scope :admins do
      get 'signup', :to => 'admins/registrations#new'
      get 'signin', :to => 'admins/sessions#new'
      delete 'signout', :to => 'admins/sessions#destroy'
    end

    #devise_for :users
    #  devise_scope :user do
    #  get '/users/sign_out' => 'devise/sessions#destroy'
    #end


  # resources :users, except: [:new]

  resources :users do
    #resources :address do
      resources :address_homes, controller: :address, type: 'Home'
      resources :address_business, controller: :address, type: 'Business'
      resources :address_jobs, controller: :address, type: 'Job'
      resources :address_pickups, controller: :address, type: 'PickUp'
      resources :address_dropoffs, controller: :address, type: 'DropOff'
      resources :contacts, controller: :contact
    #end
  end


  resources :trades, except: [:new]
  resources :admins, except: [:new]
  resources :categories, except: [:destroy]
  resources :sections, except: [:destroy]
  resources :pricings, except: [:destroy]
  resources :offers
  resources :bookings
  resources :after_register
  resources :after_address

  resources :listings do
    member do
      delete :delete_photo
      post :upload_photo
    end
    #resources :listing_pricings
    resources :quotes, only: [:create]      #listings/15/quotes
  end

  #resources :listing_pricings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'

end
