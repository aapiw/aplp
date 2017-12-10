# == Route Map
#
#                     Prefix Verb   URI Pattern                              Controller#Action
#                  user_root GET    /                                        users/dashboard#index
#                 admin_root GET    /                                        admins/dashboard#index
#                       root GET    /                                        landings#index
#           new_user_session GET    /users/sign_in(.:format)                 users/sessions#new
#               user_session POST   /users/sign_in(.:format)                 users/sessions#create
#       destroy_user_session DELETE /users/sign_out(.:format)                users/sessions#destroy
#          new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#         edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#              user_password PATCH  /users/password(.:format)                devise/passwords#update
#                            PUT    /users/password(.:format)                devise/passwords#update
#                            POST   /users/password(.:format)                devise/passwords#create
#   cancel_user_registration GET    /users/cancel(.:format)                  users/registrations#cancel
#      new_user_registration GET    /users/sign_up(.:format)                 users/registrations#new
#     edit_user_registration GET    /users/edit(.:format)                    users/registrations#edit
#          user_registration PATCH  /users(.:format)                         users/registrations#update
#                            PUT    /users(.:format)                         users/registrations#update
#                            DELETE /users(.:format)                         users/registrations#destroy
#                            POST   /users(.:format)                         users/registrations#create
#      new_user_confirmation GET    /users/confirmation/new(.:format)        devise/confirmations#new
#          user_confirmation GET    /users/confirmation(.:format)            devise/confirmations#show
#                            POST   /users/confirmation(.:format)            devise/confirmations#create
#          new_admin_session GET    /admins/sign_in(.:format)                admins/sessions#new
#              admin_session POST   /admins/sign_in(.:format)                admins/sessions#create
#      destroy_admin_session DELETE /admins/sign_out(.:format)               admins/sessions#destroy
#         new_admin_password GET    /admins/password/new(.:format)           admins/passwords#new
#        edit_admin_password GET    /admins/password/edit(.:format)          admins/passwords#edit
#             admin_password PATCH  /admins/password(.:format)               admins/passwords#update
#                            PUT    /admins/password(.:format)               admins/passwords#update
#                            POST   /admins/password(.:format)               admins/passwords#create
#  cancel_admin_registration GET    /admins/cancel(.:format)                 devise/registrations#cancel
#     new_admin_registration GET    /admins/sign_up(.:format)                devise/registrations#new
#    edit_admin_registration GET    /admins/edit(.:format)                   devise/registrations#edit
#         admin_registration PATCH  /admins(.:format)                        devise/registrations#update
#                            PUT    /admins(.:format)                        devise/registrations#update
#                            DELETE /admins(.:format)                        devise/registrations#destroy
#                            POST   /admins(.:format)                        devise/registrations#create
#     admins_dashboard_index GET    /admins/dashboard(.:format)              admins/dashboard#index
#                            POST   /admins/dashboard(.:format)              admins/dashboard#create
#       new_admins_dashboard GET    /admins/dashboard/new(.:format)          admins/dashboard#new
#      edit_admins_dashboard GET    /admins/dashboard/:id/edit(.:format)     admins/dashboard#edit
#           admins_dashboard GET    /admins/dashboard/:id(.:format)          admins/dashboard#show
#                            PATCH  /admins/dashboard/:id(.:format)          admins/dashboard#update
#                            PUT    /admins/dashboard/:id(.:format)          admins/dashboard#update
#                            DELETE /admins/dashboard/:id(.:format)          admins/dashboard#destroy
#      users_dashboard_index GET    /users/dashboard(.:format)               users/dashboard#index
#                            POST   /users/dashboard(.:format)               users/dashboard#create
#        new_users_dashboard GET    /users/dashboard/new(.:format)           users/dashboard#new
#       edit_users_dashboard GET    /users/dashboard/:id/edit(.:format)      users/dashboard#edit
#            users_dashboard GET    /users/dashboard/:id(.:format)           users/dashboard#show
#                            PATCH  /users/dashboard/:id(.:format)           users/dashboard#update
#                            PUT    /users/dashboard/:id(.:format)           users/dashboard#update
#                            DELETE /users/dashboard/:id(.:format)           users/dashboard#destroy
#                     scores GET    /scores(.:format)                        scores#index
#                            POST   /scores(.:format)                        scores#create
#                  new_score GET    /scores/new(.:format)                    scores#new
#                 edit_score GET    /scores/:id/edit(.:format)               scores#edit
#                      score GET    /scores/:id(.:format)                    scores#show
#                            PATCH  /scores/:id(.:format)                    scores#update
#                            PUT    /scores/:id(.:format)                    scores#update
#                            DELETE /scores/:id(.:format)                    scores#destroy
# present_confirmation_index GET    /confirmations(.:format)                 confirmations#index
#                            POST   /confirmations(.:format)                 confirmations#create
#   new_present_confirmation GET    /confirmations/new(.:format)             confirmations#new
#  edit_present_confirmation GET    /confirmations/:id/edit(.:format)        confirmations#edit
#       present_confirmation GET    /confirmations/:id(.:format)             confirmations#show
#                            PATCH  /confirmations/:id(.:format)             confirmations#update
#                            PUT    /confirmations/:id(.:format)             confirmations#update
#                            DELETE /confirmations/:id(.:format)             confirmations#destroy
#               bipa_courses GET    /bipa_courses(.:format)                  bipa_courses#index
#                            POST   /bipa_courses(.:format)                  bipa_courses#create
#            new_bipa_course GET    /bipa_courses/new(.:format)              bipa_courses#new
#           edit_bipa_course GET    /bipa_courses/:id/edit(.:format)         bipa_courses#edit
#                bipa_course GET    /bipa_courses/:id(.:format)              bipa_courses#show
#                            PATCH  /bipa_courses/:id(.:format)              bipa_courses#update
#                            PUT    /bipa_courses/:id(.:format)              bipa_courses#update
#                            DELETE /bipa_courses/:id(.:format)              bipa_courses#destroy
#              to_indonesias GET    /to_indonesias(.:format)                 to_indonesias#index
#                            POST   /to_indonesias(.:format)                 to_indonesias#create
#           new_to_indonesia GET    /to_indonesias/new(.:format)             to_indonesias#new
#          edit_to_indonesia GET    /to_indonesias/:id/edit(.:format)        to_indonesias#edit
#               to_indonesia GET    /to_indonesias/:id(.:format)             to_indonesias#show
#                            PATCH  /to_indonesias/:id(.:format)             to_indonesias#update
#                            PUT    /to_indonesias/:id(.:format)             to_indonesias#update
#                            DELETE /to_indonesias/:id(.:format)             to_indonesias#destroy
#                  schedules GET    /schedules(.:format)                     schedules#index
#                            POST   /schedules(.:format)                     schedules#create
#               new_schedule GET    /schedules/new(.:format)                 schedules#new
#              edit_schedule GET    /schedules/:id/edit(.:format)            schedules#edit
#                   schedule GET    /schedules/:id(.:format)                 schedules#show
#                            PATCH  /schedules/:id(.:format)                 schedules#update
#                            PUT    /schedules/:id(.:format)                 schedules#update
#                            DELETE /schedules/:id(.:format)                 schedules#destroy
#                   landings GET    /landings(.:format)                      landings#index
#                            POST   /landings(.:format)                      landings#create
#                new_landing GET    /landings/new(.:format)                  landings#new
#               edit_landing GET    /landings/:id/edit(.:format)             landings#edit
#                    landing GET    /landings/:id(.:format)                  landings#show
#                            PATCH  /landings/:id(.:format)                  landings#update
#                            PUT    /landings/:id(.:format)                  landings#update
#                            DELETE /landings/:id(.:format)                  landings#destroy
#    consulate_lists_country GET    /countries/:id/consulate_lists(.:format) countries#consulate_lists
#                  countries GET    /countries(.:format)                     countries#index
#                            POST   /countries(.:format)                     countries#create
#                new_country GET    /countries/new(.:format)                 countries#new
#               edit_country GET    /countries/:id/edit(.:format)            countries#edit
#                    country GET    /countries/:id(.:format)                 countries#show
#                            PATCH  /countries/:id(.:format)                 countries#update
#                            PUT    /countries/:id(.:format)                 countries#update
#                            DELETE /countries/:id(.:format)                 countries#destroy
# 

Rails.application.routes.draw do
  
  # root "landings#index"
  resources :invoices do
    post :send, on: :member
  end
  authenticated :user do
    root 'users/dashboard#index', as: :user_root
  end

  authenticated :admin do
    root 'admins/dashboard#index', as: :admin_root
  end

  root "landings#index"

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", confirmation: "users/confirmation", registrations: "users/registrations"}

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions",
                                                    passwords: "admins/passwords"}
  # devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  # devise_for :admins, path: 'admins'
  # eg. http://localhost:3000/admins/sign_in
  
  namespace :admins do
    resources :dashboard do
      member do
        patch :update_user
        get :confirm
        # patch :lock
        # patch :win
        # patch :contest
      end
      # collection do
      #     get :landings
      # end
    end
  end

  scope module: 'admins/dashboard' do
    # get :landings, as: :admins_landings
    post :filters
    get :profile
    patch :update_profile
    get :consulates
    post :create_consulate
  end
  
  patch "update_consulate/:id", to: "admins/dashboard#update_consulate", as: :update_consulate
  get "edit_consulate/:id", to: "admins/dashboard#edit_consulate", as: :edit_consulate
  delete "destroy_consulate/:id", to: "admins/dashboard#destroy_consulate", as: :destroy_consulate

  namespace :users do
    resources :dashboard do
      # collection do
      #   post :update_password
      # end
    end
  end

  scope module: 'users/dashboard' do
    # get :landings, as: :admins_landings
      patch :update_password
    # post :filters
    # get :consulates
    # post :create_consulate
  end
  
  resources :scores, only: [:edit, :update, :destroy] 
  resources :confirmations, as: :present_confirmation
  # scope :present do
  #   resources :confirmations
  # end
  resources :bipa_courses, only: [:destroy]
  resources :to_indonesias, only: [:destroy, :show]
  resources :schedules, only: [:update, :index]
  resources :landings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :countries do
    member do 
      get :consulate_lists
    end
  end

  # match "not_found", to: "application#not_found", via: :all

  match "*path", to: "application#not_found", via: :all


end
