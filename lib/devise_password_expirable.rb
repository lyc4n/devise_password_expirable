require 'devise_password_expirable/version'
require 'active_record'
require 'active_support/core_ext/integer'
require 'active_support/ordered_hash'
require 'active_support/concern'
require 'devise'

module Devise
  # Should the password expire (e.g 3.months)
  mattr_accessor :expire_password_after
  @@expire_password_after = 3.months

  # Validate password for strongness
  mattr_accessor :password_regex
  @@password_regex = /^\w*(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$/
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
