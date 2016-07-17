Rails.application.routes.draw do
  #had to do it like this for redirecting the user signing up to their show page
  scope "(:locale)", locale: /en|fr/ do
    devise_for :users, :controllers => { :registrations => "registrations" }
  end
  # devise_for :users, controllers: { registrations: "registrations"}
  root 'landings#index'
  #root might have to be a display page only
    #how is the user going to get to their page only
  #I want the user to be directed to their own show page upon login
  # root 'users#index' 
  get '/secure' => 'landings#secure'
  get '/tests' => 'tests#party_time'

  resources :users

  resources :users do
    resources :trips
  end
  resources :trips do
    resources :itineraries
  end
  resources :itineraries do
    resources :activities
  end
  
end
#---------------------------------------#
# -------My Devise Routes Bih!--------- #
#---------------------------------------#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          GET    /                              tests#party_time

#----------------------------------USERS DO TRIPS ROUTES --------------------------------------#
          #           root GET    /                                        landings#index
          #         secure GET    /secure(.:format)                        landings#secure
          #          tests GET    /tests(.:format)                         tests#party_time
          #     user_trips GET    /users/:user_id/trips(.:format)          trips#index
          #                POST   /users/:user_id/trips(.:format)          trips#create
          #  new_user_trip GET    /users/:user_id/trips/new(.:format)      trips#new
          # edit_user_trip GET    /users/:user_id/trips/:id/edit(.:format) trips#edit
          #      user_trip GET    /users/:user_id/trips/:id(.:format)      trips#show
          #                PATCH  /users/:user_id/trips/:id(.:format)      trips#update
          #                PUT    /users/:user_id/trips/:id(.:format)      trips#update
          #                DELETE /users/:user_id/trips/:id(.:format)      trips#destroy
          #          users GET    /users(.:format)                         users#index
          #                POST   /users(.:format)                         users#create
          #       new_user GET    /users/new(.:format)                     users#new
          #      edit_user GET    /users/:id/edit(.:format)                users#edit
          #           user GET    /users/:id(.:format)                     users#show
          #                PATCH  /users/:id(.:format)                     users#update
          #                PUT    /users/:id(.:format)                     users#update
          #                DELETE /users/:id(.:format)                     users#destroy

#-----------------------------TRIPS TO ITINERARIES ROUTING PATHS-----------------------------------#
     #    trip_itineraries GET    /trips/:trip_id/itineraries(.:format)          itineraries#index
     #                     POST   /trips/:trip_id/itineraries(.:format)          itineraries#create
     #  new_trip_itinerary GET    /trips/:trip_id/itineraries/new(.:format)      itineraries#new
     # edit_trip_itinerary GET    /trips/:trip_id/itineraries/:id/edit(.:format) itineraries#edit
     #      trip_itinerary GET    /trips/:trip_id/itineraries/:id(.:format)      itineraries#show
     #                     PATCH  /trips/:trip_id/itineraries/:id(.:format)      itineraries#update
     #                     PUT    /trips/:trip_id/itineraries/:id(.:format)      itineraries#update
     #                     DELETE /trips/:trip_id/itineraries/:id(.:format)      itineraries#destroy
     #               trips GET    /trips(.:format)                               trips#index
     #                     POST   /trips(.:format)                               trips#create
     #            new_trip GET    /trips/new(.:format)                           trips#new
     #           edit_trip GET    /trips/:id/edit(.:format)                      trips#edit
     #                trip GET    /trips/:id(.:format)                           trips#show
     #                     PATCH  /trips/:id(.:format)                           trips#update
     #                     PUT    /trips/:id(.:format)                           trips#update
     #                     DELETE /trips/:id(.:format)                           trips#destroy

#----------------------------------ITINERARY TO ACTIVITIES ROUTING PATHS -------------------------------------#
 #    itinerary_activities GET    /itineraries/:itinerary_id/activities(.:format)          activities#index
 #                         POST   /itineraries/:itinerary_id/activities(.:format)          activities#create
 #  new_itinerary_activity GET    /itineraries/:itinerary_id/activities/new(.:format)      activities#new
 # edit_itinerary_activity GET    /itineraries/:itinerary_id/activities/:id/edit(.:format) activities#edit
 #      itinerary_activity GET    /itineraries/:itinerary_id/activities/:id(.:format)      activities#show
 #                         PATCH  /itineraries/:itinerary_id/activities/:id(.:format)      activities#update
 #                         PUT    /itineraries/:itinerary_id/activities/:id(.:format)      activities#update
 #                         DELETE /itineraries/:itinerary_id/activities/:id(.:format)      activities#destroy
 #             itineraries GET    /itineraries(.:format)                                   itineraries#index
 #                         POST   /itineraries(.:format)                                   itineraries#create
 #           new_itinerary GET    /itineraries/new(.:format)                               itineraries#new
 #          edit_itinerary GET    /itineraries/:id/edit(.:format)                          itineraries#edit
 #               itinerary GET    /itineraries/:id(.:format)                               itineraries#show
 #                         PATCH  /itineraries/:id(.:format)                               itineraries#update
 #                         PUT    /itineraries/:id(.:format)                               itineraries#update
 #                         DELETE /itineraries/:id(.:format)                               itineraries#destroy 

# The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

