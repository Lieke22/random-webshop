Theekoning::Application.routes.draw do
  get 'admin' => 'admin#index'
  get 'faq' => 'pages#faq'
  get 'contact' => 'pages#contact'
  get 'news' => 'pages#news'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"

  resources :users

  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    resources :pages
    root 'store#index', as: 'store', via: :all

  end







end
