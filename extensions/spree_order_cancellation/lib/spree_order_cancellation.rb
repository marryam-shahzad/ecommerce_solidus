require 'spree_core'
require 'spree_extension'

module SpreeOrderCancellation
  class Engine < Rails::Engine
    engine_name 'spree_order_cancellation'

    # Enables order cancellation feature
    initializer 'spree_order_cancellation.configuration' do |app|
      Spree::PermittedAttributes.order_attributes.push(:cancellation_reason)
      Spree::Order.prepend(SpreeOrderCancellation::OrderDecorator)
    end
  end
end
