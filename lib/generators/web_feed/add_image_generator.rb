require 'rails/generators/active_record'

module WebFeed

  class AddImageGenerator < ActiveRecord::Generators::Base
  
    source_root File.expand_path('../templates', __FILE__)

    def generate_migration
      migration_template "migrations/add_attachment_image_to_news.rb.erb", "db/migrate/add_attachment_image_to_#{name.downcase.underscore.pluralize}.rb"
    end

  end

end
