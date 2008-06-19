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
  
  # :players
  map.resources :players do |players|
    players.resources :rounds do |rounds|
    end
    players.resources :stats do |stats|
    end
    players.resources :friends do |friends|
    end
    players.resources :schedules do |schedules|
    end
    players.resources :tournaments do |tournaments|
      tournaments.resources :scorecards do |scorecards|
      end
    end
    players.resources :clubsets do |clubsets|
    end
  end
  
  # states / courses:tees   ...states/ tournaments:types:years
  map.resources(:states) do |states|
    states.resources :courses do |courses|
      courses.resources :tees do |tees|
      end
    end
    states.resources :tournaments do |tournaments|
      tournaments.resources :types do |types|
        types.resources :years do |years|
        end
      end
    end
    states.resources :weather do |weather|
      weather.resources :date do |date|
      end
    end
  end
  
  #settings
  map.resources :settings do |settings|
  end
  
  #news 
  map.resources :news do |news|
    news.resources :category do |category|
    end
  end
  
  # leaderboard by :id
  map.resources :leaderboards do |leaderboard|
  end
  
  # leaderboards
  map.namespace(:leaderboards) do |lb|
    lb.resources :types do |types|
      types.resources :states do |states|
        states.resources :years do |years|
        end
      end
    end
  end
  
  # equipment!
  map.namespace(:equipment) do |eq|
    eq.resources :types do |types|
      types.resources :manufacturers do |manufacturers|
        manufacturers.resources :models do |models|
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
