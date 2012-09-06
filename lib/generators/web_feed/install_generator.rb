require 'rails/generators'

module WebFeed

  class InstallGenerator < Rails::Generators::Base
    
    class_option :resource    , :type => :string, :desc => 'Change the name for resources'  , :default => 'resource'  , :aliases => '-r'
    class_option :keyword     , :type => :string, :desc => 'Change the name for keywords'   , :default => 'keyword'   , :aliases => '-k'
    class_option :news        , :type => :string, :desc => 'Change the name for news'       , :default => 'news'      , :aliases => '-n'

    class_option :include_models        , :type => :boolean, :desc => 'Create model files'                            , :aliases => '-m'
    class_option :include_controllers   , :type => :boolean, :desc => 'Create controller files'                       , :aliases => '-c'
    class_option :include_views         , :type => :boolean, :desc => 'Create view files'                             , :aliases => '-v'

    desc "Create routes, migrations, models, controllers, views"
    
    source_root File.expand_path('../templates', __FILE__)

    def init
      route <<-RES
resources :#{resource.pluralize} do
    member do 
      post :read
    end
  end
        RES
      route <<-NEWS
resources :#{news.pluralize} do
    member do
      get "/:title(.:format)", :action => :show, :as => 'read'
      post :publish
      post :unpublish
    end
  end
        NEWS
      route "resources :#{keyword.pluralize}"
    end

    def generate_migration
      generate "web_feed:resource #{resource}"
      generate "web_feed:news #{news}"
      generate "web_feed:keyword #{keyword}"
      generate "web_feed:add_image #{news}"
    end

    def generate_app
      if options.include_models?
        template "models/resource.rb.erb",  "#{Rails.root}/app/models/#{resource}.rb"
        template "models/news.rb.erb",      "#{Rails.root}/app/models/#{news}.rb"
        template "models/keyword.rb.erb",   "#{Rails.root}/app/models/#{keyword}.rb"
      end
      if options.include_controllers?
        template "controllers/resources_controller.rb.erb", "#{Rails.root}/app/controllers/#{resource.pluralize}_controller.rb"
        template "controllers/news_controller.rb.erb",      "#{Rails.root}/app/controllers/#{news.pluralize}_controller.rb"
        template "controllers/keywords_controller.rb.erb",  "#{Rails.root}/app/controllers/#{keyword.pluralize}_controller.rb"
      end
      if options.include_views?
        %w( index new edit _form).each do |file|
          template "views/resources/#{file}.html.erb", "#{Rails.root}/app/views/#{resource.pluralize}/#{file}.html.erb"
        end
        %w( index new edit _form).each do |file|
          template "views/keywords/#{file}.html.erb", "#{Rails.root}/app/views/#{keyword.pluralize}/#{file}.html.erb"
        end
        %w( index show).each do |file|
          template "views/news/#{file}.html.erb",    "#{Rails.root}/app/views/#{news.pluralize}/#{file}.html.erb"
        end
        copy_file "views/layouts/webfeed.html.erb",   "#{Rails.root}/app/views/layouts/webfeed.html.erb"
        template  "views/layouts/_webfeed.html.erb",  "#{Rails.root}/app/views/layouts/_webfeed.html.erb"
        copy_file "stylesheets/webfeed.css",          "#{Rails.root}/app/assets/stylesheets/webfeed.css"
      end
    end

    protected

      def resource
        options.resource.downcase.singularize
      end

      def keyword
        options.keyword.downcase.singularize
      end

      def news
        options.news.downcase.singularize
      end

  end

end
