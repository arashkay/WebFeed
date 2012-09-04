require 'rails/generators'

module WebFeed

  class InstallGenerator < Rails::Generators::Base
  
    desc "Create routes for resources"
    def create_routes
      route "resources :resources"
      route "resources :keywords"
      route "resources :news"
    end

  end
end
