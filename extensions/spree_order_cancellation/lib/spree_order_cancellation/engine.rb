module SpreeOrderCancellation
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_order_cancellation'

    # Include your extension's routes here
    # Example:
    # engine_routes do
    #   get 'my_extension', to: 'my_extension#index'
    # end

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'spree_order_cancellation.environment', before: :load_config_initializers do |_app|
      Spree::AppConfiguration.class_eval do
        # Enable order cancellation feature
        preference :allow_canceling_orders, :boolean, default: true
      end
    end
  end
end
