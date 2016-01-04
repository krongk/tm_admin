RainCms::Application.routes.draw do
   

  # routes for Tm_Admin
  resources :biz_sites

  namespace :resource do
    resources :musics
  end

  resources :site_payments

  namespace :payment do
    resources :coupons
  end

  namespace :payment do
    resources :tokens
  end

  resources :members

  resources :common_keys

  namespace :templates do
    resources :keystores
  end

  get "s/index"
  get "s/search"
  get "s/tag"
  get "s/book"
  get "s/comment"
  get "s/forward"
  get "s/digg"
  resources :site_page_keystores

  resources :site_comments

  resources :site_pages
  resources :site_images

  resources :sites do
    collection do
      get :payed
      get :toogle_typo
      get :set_free
      get :pay
    end
  end

  namespace :sites do
    post "temp_form_update"
  end


  namespace :templates do
    get "home/help"
    resources :cates
    resources :pages
    resources :templates
    resources :themes
  end

  resources :comments

 #routes for admin ==============================
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :pages
    resources :channels
    resources :keystores
    resources :comments
    get "home/ckeditor_pictures"
    get "home/help"
    get "templetes/index"
    get "templetes/show"
    get "templetes/new"
    post "templetes/create"
    get "templetes/edit"
    post "templetes/update"
    get "templetes/destroy"
    get "templetes/update_cache"
  end
  #routes for front ==============================
  root :to => "welcome#index"
  
  #match search/tag special path
  match '/search(/page/:page)', to: "welcome#search", via: :get, as: 'search'
  match '/tag/:tag(/page/:page)', to: "welcome#tag", as: 'tag', via: :get
  #match '/:profession/:state_code/:dik/:classify_type/(:action(/:id))' => 
  #  'sanction', 
  #  :constraints => { :dik => /\d{4}.\d{2}.\d{2}/,  
  #  :classify_type => /title|date|skip/ }
  match '/channel/:channel(/:id)', to: "welcome#index", via: :get
  match '/channel/:channel(/page/:page)', to: "welcome#index", via: :get


end
