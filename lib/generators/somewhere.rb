require 'rails/generators/migration'

module Somewhere
	module Generators
		class RoleGenerator < Rails::Generators::Base
			include Rails::Generators::Migration

			source_root File.expand_path('../templates', __FILE__)
			argument :prefix, :type => :string, :default => ""
			argument :model, :type => :string, :default => "User"

			desc "Generates an address migration with the given PREFIX and for the given MODEL"

			def copy_address_file
				migration_template "migration.rb", "db/migrate/add_address_to_#{model}"
			end
		end
	end
end
