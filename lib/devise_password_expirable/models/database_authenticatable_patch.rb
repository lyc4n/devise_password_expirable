module Devise
  module Models
    module DatabaseAuthenticatablePatch
      def update_with_password(params={})
        current_password = params.delete(:current_password)

        new_password = params[:password]
        new_password_confirmation = params[:password_confirmation]

        result = if valid_password?(current_password) && new_password.present? && new_password_confirmation.present?
          update_attributes(params)
        else
          if current_password.blank?
            self.errors.add(:current_password, :blank)
          elsif !valid_password?(current_password)
            self.errors.add(:current_password, :invalid)
          end

          if new_password.blank?
            self.errors.add(:password, :blank)
          end
          if new_password_confirmation.blank?
            self.errors.add(:password_confirmation, :blank)
          end
          
          self.attributes = params
          false
        end

        clean_up_passwords
        result
      end
    end
  end
end