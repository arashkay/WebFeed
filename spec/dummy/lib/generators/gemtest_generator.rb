class GemtestGenerator < Rails::Generators::Base
  
  desc "Create routes"
  def create_routes
    route "resources :resources"
    route "resources :keywords"
    route "resources :news"
  end

end
