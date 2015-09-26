Rails.application.routes.draw do
  
  devise_for :users
  # defaults to dashboard
  root :to => 'dashboard#dashboard_h'

  get 'fligths/search' => 'flights#search', as: :search_flights
  post 'flights/do_search' => "flights#do_search", as: :do_search_fligths
  get 'flights/:id/add_people' => 'flights#add_people', as: :flight_add_people
  post 'flights/:id/add_person/:person_id' => 'flights#add_person', as: :flight_add_person
  post 'flights/:id/remove_person/:person_id' => 'flights#remove_person', as: :flight_remove_person
  get 'flights/:id/finish' => 'flights#finish', as: :flight_finish
  
  get 'users/search' => 'users#search', as: :search_users
  post 'users/do_search' => "users#do_search", as: :do_search_users
  
  get 'planes/search' => 'planes#search', as: :search_planes
  post 'planes/do_search' => "planes#do_search", as: :do_search_planes

  get 'services/search' => 'services#search', as: :search_services
  post 'services/do_search' => "services#do_search", as: :do_search_services

  get 'flight_types/search' => 'flight_types#search', as: :search_flight_types
  post 'flight_types/do_search' => "flight_types#do_search", as: :do_search_flight_types

  get 'habilitation/:id' => 'pilot_habilitations#habilitation', as: :habilitation
  
  get 'users/recover' => 'users#recover', as: :recover
  post 'users/do_recover' => 'users#do_recover', as: :do_recover
    
  resources :planes
  resources :people
  resources :users
  resources :flights
  resources :ticket_flights
  resources :ticket_members
  resources :flight_types
  resources :services
  resources :pilot_habilitations
  resources :lists
  put 'flights/:id/deshabilitar' => 'flights#deshabilitar', as: :flight_deshabilitar
  put 'flights/:id/activar' => 'flights#activar', as: :flight_activar

  put 'ticket_flights/:id/deshabilitar' => 'ticket_flights#deshabilitar', as: :ticket_flights_deshabilitar
  put 'ticket_flights/:id/activar' => 'ticket_flights#activar', as: :ticket_flight_activar
  get 'ticket_flights/:id/finish' => 'ticket_flights#finish', as: :ticket_flight_finish

  get 'information/top_time' => 'lists#top_time', as: :top_time
  get 'information/people_with_debt' => 'lists#debt', as: :debt
  get 'information/monthly(/:year/:month)' => 'lists#monthly', as: :monthly



  # view routes
  get '/widgets' => 'widgets#index'
  get '/documentation' => 'documentation#index'

  get 'dashboard/dashboard_v1'
  get 'dashboard/dashboard_v2'
  get 'dashboard/dashboard_v3'
  get 'dashboard/dashboard_h'
  get 'elements/button'
  get 'elements/notification'
  get 'elements/spinner'
  get 'elements/animation'
  get 'elements/dropdown'
  get 'elements/nestable'
  get 'elements/sortable'
  get 'elements/panel'
  get 'elements/portlet'
  get 'elements/grid'
  get 'elements/gridmasonry'
  get 'elements/typography'
  get 'elements/fonticons'
  get 'elements/weathericons'
  get 'elements/colors'
  get 'elements/buttons'
  get 'elements/notifications'
  get 'elements/carousel'
  get 'forms/standard'
  get 'forms/extended'
  get 'forms/validation'
  get 'forms/wizard'
  get 'forms/upload'
  get 'forms/xeditable'
  get 'multilevel/level1'
  get 'multilevel/level3'
  get 'charts/flot'
  get 'charts/radial'
  get 'charts/chartjs'
  get 'charts/chartist'
  get 'charts/morris'
  get 'charts/rickshaw'
  get 'tables/standard'
  get 'tables/extended'
  get 'tables/datatable'
  get 'tables/jqgrid'
  get 'maps/google'
  get 'maps/vector'
  get 'extras/mailbox'
  get 'extras/timeline'
  get 'extras/calendar'
  get 'extras/invoice'
  get 'extras/search'
  get 'extras/todo'
  get 'extras/profile'
  get 'blog/blog'
  get 'blog/blog_post'
  get 'blog/blog_articles'
  get 'blog/blog_article_view'
  get 'ecommerce/ecommerce_orders'
  get 'ecommerce/ecommerce_order_view'
  get 'ecommerce/ecommerce_products'
  get 'ecommerce/ecommerce_product_view'
  get 'forum/forum_categories'
  get 'forum/forum_topics'
  get 'forum/forum_discussion'
  get 'pages/login'
  get 'pages/register'
  get 'pages/recover'
  get 'pages/lock'
  get 'pages/template'
  get 'pages/notfound'

  # api routes
  get '/api/documentation' => 'api#documentation'
  get '/api/datatable' => 'api#datatable'
  get '/api/jqgrid' => 'api#jqgrid'
  get '/api/jqgridtree' => 'api#jqgridtree'
  get '/api/i18n/:locale' => 'api#i18n'
  post '/api/xeditable' => 'api#xeditable'
  get '/api/xeditable-groups' => 'api#xeditablegroups'

  # the rest goes to root
  get '*path' => redirect('/')
end
