module DevisePasswordExpirable
  module Generators
    # Install Generator
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Install the devise password expirable extension"

      def add_configs
        devise_initializer_path = "config/initializers/devise.rb"
        if File.exist?(devise_initializer_path)
          old_content = File.read(devise_initializer_path)
          
          if old_content.match(Regexp.new(/^\s# ==> Password Expirable Extension\n/))
            false
          else
            inject_into_file(devise_initializer_path, :before => "  # ==> Configuration for :confirmable\n") do
<<-CONTENT
  # ==> Password Expirable Extension
  # Configure expire passwords extension for devise

  # Should the password expire (e.g 3.months)
  # config.expire_password_after = false

  # Need 1 char of A-Z, a-z and 0-9
  # config.password_regex = /(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])/

CONTENT
            end
          end
        end
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise.password_expirable.en.yml"
      end
    end
  end
end