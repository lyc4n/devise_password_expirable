module DevisePasswordExpirable
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include DevisePasswordExpirable::Controllers::Helpers
    end
  end
end
