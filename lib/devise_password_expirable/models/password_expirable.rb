require 'devise_password_expirable/hooks/password_expirable'

module Devise
  module Models

    # PasswordExpirable takes care of change password after
    module PasswordExpirable
      extend ActiveSupport::Concern

      included do
        before_save :update_password_changed
      end

      # is an password change required?
      def need_change_password?
        if self.class.expire_password_after.is_a? Fixnum or self.class.expire_password_after.is_a? Float
          self.last_password_reset.nil? or self.last_password_reset < self.class.expire_password_after.ago
        else
          false
        end
      end

      # set a fake datetime so a password change is needed and save the record
      def need_change_password!
        if self.class.expire_password_after.is_a? Fixnum or self.class.expire_password_after.is_a? Float
          need_change_password
          self.save(:validate => false)
        end
      end

      # set a fake datetime so a password change is needed
      def need_change_password
        if self.class.expire_password_after.is_a? Fixnum or self.class.expire_password_after.is_a? Float
          self.last_password_reset = self.class.expire_password_after.ago
        end

        # is date not set it will set default to need set new password next login
        need_change_password if self.last_password_reset.nil?

        self.last_password_reset
      end

      private

        # is password changed then update password_cahanged_at
        def update_password_changed
          self.last_password_reset = Time.now if (self.new_record? or self.encrypted_password_changed?) and not self.last_password_reset_changed?
        end

      module ClassMethods
        ::Devise::Models.config(self, :expire_password_after)
      end
    end

  end

end
