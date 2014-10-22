module DevisePasswordExpirable
  class Engine < ::Rails::Engine # :nodoc:
    ActiveSupport.on_load(:action_controller) do
      include DevisePasswordExpirable::Controllers::Helpers
    end    
  end
end
