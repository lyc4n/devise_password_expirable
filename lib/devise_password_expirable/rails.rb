module DevisePasswordExpirable
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include DevisePasswordExpirable::Controllers::Helpers
    end
    
    ActionDispatch::Callbacks.to_prepare do
      DevisePasswordExpirable::Patches.apply
    end

  end
end
