Rails.application.routes.draw do
  resources :user_stats
  resources :daily_visitors
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :tiers
  resources :trims
  resources :owners
  resources :years
  resources :partners
  resources :cars
  resources :conversations
  resources :messages
  resources :millages
  resources :car_models
  resources :brands
  resources :valuations
  resources :password_resets
  resources :admins

  resources :users do
    member do
      get :confirm_email
    end
  end

  root :to => 'home#index'


  get "add_order_to_model" => "home#add_order_to_model", :as => "add_order_to_model"
  get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email'
  get "logout_admin" => "home#logout_admin", :as => "logout_admin"
  get "logout" => "home#logout", :as => "logout"
  get "administrator" => "home#administrator", :as => "administrator"
  get "goAdmin" => "home#goAdmin", :as => "goAdmin"
  get "goUser" => "home#goUser", :as => "goUser"
  get "profile" => "home#profile", :as => "profile"
  get "settings" => "home#settings", :as => "settings"
  get "user_registration" => "home#user_registration", :as => "user_registration"
  get "register_valuation" => "home#register_valuation", :as => "register_valuation"
  get "update_user_info" => "home#update_user_info", :as => "update_user_info"
  get "admin_dashboard" => "home#admin_dashboard", :as => "admin_dashboard"
  get "send_message_to_user" => "home#send_message_to_user", :as => "send_message_to_user"
  get "send_message" => "home#send_message", :as => "send_message"
  get "getModels" => "home#getModels", :as => "getModels"
  get "delete_year" => "home#delete_year", :as => "delete_year"
  get "delete_owner" => "home#delete_owner", :as => "delete_owner"
  get "delete_millage" => "home#delete_millage", :as => "delete_millage"
  get "delete_car_model" => "home#delete_car_model", :as => "delete_car_model"
  get "delete_brand" => "home#delete_brand", :as => "delete_brand"
  get "delete_trim" => "home#delete_trim", :as => "delete_trim"
  get "delete_user" => "home#delete_user", :as => "delete_user"
  get "delete_tier" => "home#delete_tier", :as => "delete_tier"
  get "login_user_js" => "home#login_user_js", :as => "login_user_js"
  get "register_user_js" => "home#register_user_js", :as => "register_user_js"
  get "send_password_reset" => "home#send_password_reset", :as => "send_password_reset"
  get "getMessages" => "home#getMessages", :as => "getMessages"
  get "update_pass" => "home#update_pass", :as => "update_pass"
  get "getBrands" => "home#getBrands", :as => "getBrands"
  get "getYears" => "home#getYears", :as => "getYears"
  get "getKM" => "home#getKM", :as => "getKM"
  get "update_model_listing" => "home#update_model_listing", :as => "update_model_listing"



  # API Methods


  post "register_user_service" => "api#register_user_service", :as => "register_user_service"
  post "login_user_service" => "api#login_user_service", :as => "login_user_service"
  post "register_valuation_service" => "api#register_valuation_service", :as => "register_valuation_service"
  post "send_password_reset_service" => "api#send_password_reset_service", :as => "send_password_reset_service"
  post "update_info_service" => "api#update_info_service", :as => "update_info_service"



  get "get_km_service" => "api#get_km_service", :as => "get_km_service"
  get "get_years_service" => "api#get_years_service", :as => "get_years_service"
  get "get_brands_service" => "api#get_brands_service", :as => "get_brands_service"
  get "get_models_service" => "api#get_models_service", :as => "get_models_service"



    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
