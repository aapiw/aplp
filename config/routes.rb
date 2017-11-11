# == Route Map
#
#                    Prefix Verb   URI Pattern                              Controller#Action
#                      root GET    /                                        landings#index
#          new_user_session GET    /users/sign_in(.:format)                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)            users/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)           users/passwords#edit
#             user_password PATCH  /users/password(.:format)                users/passwords#update
#                           PUT    /users/password(.:format)                users/passwords#update
#                           POST   /users/password(.:format)                users/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                         users/registrations#update
#                           PUT    /users(.:format)                         users/registrations#update
#                           DELETE /users(.:format)                         users/registrations#destroy
#                           POST   /users(.:format)                         users/registrations#create
#     new_user_confirmation GET    /users/confirmation/new(.:format)        users/confirmations#new
#         user_confirmation GET    /users/confirmation(.:format)            users/confirmations#show
#                           POST   /users/confirmation(.:format)            users/confirmations#create
#         new_admin_session GET    /admins/sign_in(.:format)                admins/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                admins/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)               admins/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)           admins/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)          admins/passwords#edit
#            admin_password PATCH  /admins/password(.:format)               admins/passwords#update
#                           PUT    /admins/password(.:format)               admins/passwords#update
#                           POST   /admins/password(.:format)               admins/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                 admins/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                admins/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                   admins/registrations#edit
#        admin_registration PATCH  /admins(.:format)                        admins/registrations#update
#                           PUT    /admins(.:format)                        admins/registrations#update
#                           DELETE /admins(.:format)                        admins/registrations#destroy
#                           POST   /admins(.:format)                        admins/registrations#create
#                    scores GET    /scores(.:format)                        scores#index
#                           POST   /scores(.:format)                        scores#create
#                 new_score GET    /scores/new(.:format)                    scores#new
#                edit_score GET    /scores/:id/edit(.:format)               scores#edit
#                     score GET    /scores/:id(.:format)                    scores#show
#                           PATCH  /scores/:id(.:format)                    scores#update
#                           PUT    /scores/:id(.:format)                    scores#update
#                           DELETE /scores/:id(.:format)                    scores#destroy
#             confirmations GET    /confirmations(.:format)                 confirmations#index
#                           POST   /confirmations(.:format)                 confirmations#create
#          new_confirmation GET    /confirmations/new(.:format)             confirmations#new
#         edit_confirmation GET    /confirmations/:id/edit(.:format)        confirmations#edit
#              confirmation GET    /confirmations/:id(.:format)             confirmations#show
#                           PATCH  /confirmations/:id(.:format)             confirmations#update
#                           PUT    /confirmations/:id(.:format)             confirmations#update
#                           DELETE /confirmations/:id(.:format)             confirmations#destroy
#              bipa_courses GET    /bipa_courses(.:format)                  bipa_courses#index
#                           POST   /bipa_courses(.:format)                  bipa_courses#create
#           new_bipa_course GET    /bipa_courses/new(.:format)              bipa_courses#new
#          edit_bipa_course GET    /bipa_courses/:id/edit(.:format)         bipa_courses#edit
#               bipa_course GET    /bipa_courses/:id(.:format)              bipa_courses#show
#                           PATCH  /bipa_courses/:id(.:format)              bipa_courses#update
#                           PUT    /bipa_courses/:id(.:format)              bipa_courses#update
#                           DELETE /bipa_courses/:id(.:format)              bipa_courses#destroy
#              to_indonesia GET    /to_indonesia(.:format)                  to_indonesia#index
#                           POST   /to_indonesia(.:format)                  to_indonesia#create
#         new_to_indonesium GET    /to_indonesia/new(.:format)              to_indonesia#new
#        edit_to_indonesium GET    /to_indonesia/:id/edit(.:format)         to_indonesia#edit
#             to_indonesium GET    /to_indonesia/:id(.:format)              to_indonesia#show
#                           PATCH  /to_indonesia/:id(.:format)              to_indonesia#update
#                           PUT    /to_indonesia/:id(.:format)              to_indonesia#update
#                           DELETE /to_indonesia/:id(.:format)              to_indonesia#destroy
#                 schedules GET    /schedules(.:format)                     schedules#index
#                           POST   /schedules(.:format)                     schedules#create
#              new_schedule GET    /schedules/new(.:format)                 schedules#new
#             edit_schedule GET    /schedules/:id/edit(.:format)            schedules#edit
#                  schedule GET    /schedules/:id(.:format)                 schedules#show
#                           PATCH  /schedules/:id(.:format)                 schedules#update
#                           PUT    /schedules/:id(.:format)                 schedules#update
#                           DELETE /schedules/:id(.:format)                 schedules#destroy
#                  landings GET    /landings(.:format)                      landings#index
#                           POST   /landings(.:format)                      landings#create
#               new_landing GET    /landings/new(.:format)                  landings#new
#              edit_landing GET    /landings/:id/edit(.:format)             landings#edit
#                   landing GET    /landings/:id(.:format)                  landings#show
#                           PATCH  /landings/:id(.:format)                  landings#update
#                           PUT    /landings/:id(.:format)                  landings#update
#                           DELETE /landings/:id(.:format)                  landings#destroy
#   consulate_lists_country GET    /countries/:id/consulate_lists(.:format) countries#consulate_lists
#                 countries GET    /countries(.:format)                     countries#index
#                           POST   /countries(.:format)                     countries#create
#               new_country GET    /countries/new(.:format)                 countries#new
#              edit_country GET    /countries/:id/edit(.:format)            countries#edit
#                   country GET    /countries/:id(.:format)                 countries#show
#                           PATCH  /countries/:id(.:format)                 countries#update
#                           PUT    /countries/:id(.:format)                 countries#update
#                           DELETE /countries/:id(.:format)                 countries#destroy
# 

Rails.application.routes.draw do
  root "landings#index"

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations",
                                                    confirmations: "users/confirmations", passwords: "users/passwords"}
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations",
                                                    confirmations: "admins/confirmations", passwords: "admins/passwords"}
  
  resources :scores
  resources :confirmations
  resources :bipa_courses
  resources :to_indonesia
  resources :schedules
  resources :landings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :countries do 
    member do 
      get :consulate_lists
    end
  end

end
