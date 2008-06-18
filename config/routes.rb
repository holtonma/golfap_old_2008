ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #map.resources :patrons, :has_many => [:squads]#, :has_one => :settings
  # map.resources :golfers, :has_many => [:poolstats, :scorecards]
  
  map.resource :session
  
  # namespace routes so that we don't get a collision between some of the common ControllerNames: rounds, majors, etc
  map.namespace(:golf) do |golf|
    # :majors
    golf.resources :majors do |majors|
      majors.resources :years do |years|
        years.resources :rounds do |rounds|
        end
      end
    end
  end
  
  # :golfers
  map.namespace(:research) do |research|
    research.resources :golfers do |golfers|
      golfers.resources :majors do |majors|
        majors.resources :years do |years|
          years.resources :rounds do |rounds|
          end
        end
      end
      golfers.resources :poolstats do |poolstats|
      end
    end
  end
  
  # :golfpool -- global leaderboard 
  map.namespace(:golfpool) do |golfpool|
    golfpool.resources :majors do |majors|
      majors.resources :years do |years|
        years.resources :rounds do |rounds|
        end
      end
    end
  end
  
  # --- authenticate below --- : 
  
  # :groups
  map.namespace(:member) do |authenticated|
    authenticated.resources :groups do |groups|
      groups.resources :majors do |majors|
        majors.resources :years do |years|
          years.resources :rounds do |rounds|
          end
        end
      end
      groups.resources :messages do |messages|
      end
      groups.resources :patrons do |patrons|
        patrons.resources :squads do |squads|
        end
        patrons.resources :settings do |settings|
        end
        patrons.resources :friends do |friends|
        end
      end
    end
  end
  
  # :admin
  map.namespace(:admin) do |admin|
  end
  
  # :images
  #map.resources :images, :has_many => [ :majors, :tags ]
  
  
  
    # map.namespace(:admin) do |admin|
    #   admin.resources :products,
    #     :collection => { :inventory => :get  },
    #     :member     => { :duplicate => :post },
    #     :has_many   => [ :tags, :images, :variants ]
    # end
  
    # map.resources :pools, :has_one => :leaderboards
    # map.resources :images
    # map.resources :images, :has_many => [:events]
  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
