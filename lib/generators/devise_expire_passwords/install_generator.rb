module DevisePasswordExpirable
  module Generators
    # Install Generator
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Install the devise password expirable extension"

      def add_configs
        inject_into_file "config/initializers/devise.rb", "\n  # ==> Password Expirable Extension\n  # Configure expire passwords extension for devise\n\n" +
        "  # Should the password expire (e.g 3.months)\n" +
        "  # config.expire_password_after = false\n\n" +
        "  # Need 1 char of A-Z, a-z and 0-9\n" +
        "  # config.password_regex = /(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])/\n\n" +
        "", :before => /end[ |\n|]+\Z/
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise.password_expirable.en.yml"
      end
    end
  end
end