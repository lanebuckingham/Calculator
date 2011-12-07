Calculator::Application.routes.draw do

  root :to => "buttons#Home" 

  match "buttons/Home" => 'buttons#home'
  match "buttons/Backspace" => 'buttons#backspace'
  match "buttons/CE" => 'buttons#ce'
  match "buttons/C" => 'buttons#c'
  match "buttons/MC" => 'buttons#mc'
  match "buttons/MR" => 'buttons#mr'
  match "buttons/MS" => 'buttons#ms'
  match "buttons/MPlus" => 'buttons#m_plus'
  match "buttons/MMinus" => 'buttons#m_minus'
  match "buttons/One" => 'buttons#input', :num => 1
  match "buttons/Two" => 'buttons#input', :num => 2
  match "buttons/Three" => 'buttons#input', :num => 3
  match "buttons/Four" => 'buttons#input', :num => 4
  match "buttons/Five" => 'buttons#input', :num => 5
  match "buttons/Six" => 'buttons#input', :num => 6
  match "buttons/Seven" => 'buttons#input', :num => 7
  match "buttons/Eight" => 'buttons#input', :num => 8
  match "buttons/Nine" => 'buttons#input', :num => 9
  match "buttons/Zero" => 'buttons#input', :num => 0
  match "buttons/PlusMinus" => 'buttons#plus_minus'
  match "buttons/Dot" => 'buttons#dot'
  match "buttons/Divide" => 'buttons#divide'
  match "buttons/Multiply" => 'buttons#multiply'
  match "buttons/Add" => 'buttons#plus'
  match "buttons/Subtract" => 'buttons#minus'
  match "buttons/Sqrt" => 'buttons#square_root'
  match "buttons/Percent" => 'buttons#percent'
  match "buttons/OneOver" => 'buttons#reciprocal'
  match "buttons/Equals" => 'buttons#equals'

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
