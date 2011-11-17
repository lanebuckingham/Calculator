Calculator::Application.routes.draw do

  root :to => "buttons#Home" 

  match "buttons/Home" => 'buttons#Home'
  match "buttons/Backspace" => 'buttons#Backspace'
  match "buttons/CE" => 'buttons#CE'
  match "buttons/C" => 'buttons#C'
  match "buttons/MC" => 'buttons#MC'
  match "buttons/MR" => 'buttons#MR'
  match "buttons/MS" => 'buttons#MS'
  match "buttons/MPlus" => 'buttons#MPlus'
  match "buttons/One" => 'buttons#One'
  match "buttons/Two" => 'buttons#Two'
  match "buttons/Three" => 'buttons#Three'
  match "buttons/Four" => 'buttons#Four'
  match "buttons/Five" => 'buttons#Five'
  match "buttons/Six" => 'buttons#Six'
  match "buttons/Seven" => 'buttons#Seven'
  match "buttons/Eight" => 'buttons#Eight'
  match "buttons/Nine" => 'buttons#Nine'
  match "buttons/Zero" => 'buttons#Zero'
  match "buttons/PlusMinus" => 'buttons#PlusMinus'
  match "buttons/Dot" => 'buttons#Dot'
  match "buttons/Divide" => 'buttons#Divide'
  match "buttons/Multiply" => 'buttons#Multiply'
  match "buttons/Add" => 'buttons#Add'
  match "buttons/Subtract" => 'buttons#Subtract'
  match "buttons/Sqrt" => 'buttons#Sqrt'
  match "buttons/Percent" => 'buttons#Percent'
  match "buttons/OneOver" => 'buttons#OneOver'
  match "buttons/Equals" => 'buttons#Equals'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
