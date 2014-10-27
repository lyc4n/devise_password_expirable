require 'devise_password_expirable/version'
require 'active_record/connection_adapters/abstract/schema_definitions'
require 'active_support/core_ext/integer'
require 'active_support/ordered_hash'
require 'active_support/concern'
require 'devise'

module Devise # :nodoc:
  
  # Should the password expire (e.g 3.months)
  mattr_accessor :expire_password_after
  @@expire_password_after = 3.months

end

# an security extension for devise
module DevisePasswordExpirable
  autoload :Schema, 'devise_password_expirable/schema'

  module Controllers
    autoload :Helpers, 'devise_password_expirable/controllers/helpers'
  end
end

# modules
Devise.add_module :password_expirable, :controller => :password_expirable, :model => 'devise_password_expirable/models/password_expirable', :route => :password_expired

# requires
require 'devise_password_expirable/routes'
require 'devise_password_expirable/rails'
require 'devise_password_expirable/orm/active_record'
