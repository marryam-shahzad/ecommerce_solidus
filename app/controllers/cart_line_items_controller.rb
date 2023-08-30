# frozen_string_literal: true

class CartLineItemsController < StoreController
  helper 'spree/products', 'orders'

  respond_to :html

  before_action :store_guest_token

  # # Adds a new item to the order (creating a new order if none already exists)
  # def create
  #   @order = current_order(create_order_if_necessary: true)
  #   authorize! :update, @order, cookies.signed[:guest_token]

  #   variant  = Spree::Variant.find(params[:variant_id])
  #   quantity = params[:quantity].present? ? params[:quantity].to_i : 1

  #   # 2,147,483,647 is crazy. See issue https://github.com/spree/spree/issues/2695.
  #   if !quantity.between?(1, 2_147_483_647)
  #     @order.errors.add(:base, t('spree.please_enter_reasonable_quantity'))
  #   else
  #     begin
  #       @line_item = @order.contents.add(variant, quantity)
  #     rescue ActiveRecord::RecordInvalid => error
  #       @order.errors.add(:base, error.record.errors.full_messages.join(", "))
  #     end
  #   end

  #   respond_to do |format|
  #     format.html do
  #       if @order.errors.any?
  #         flash[:error] = @order.errors.full_messages.join(", ")
  #         redirect_back_or_default(root_path)
  #         return
  #       else
  #         redirect_to cart_path
  #       end
  #     end
  #   end
  # end

  def create
  @order = current_order(create_order_if_necessary: true)
  authorize! :update, @order, cookies.signed[:guest_token]

  variant = Spree::Variant.find(params[:variant_id])
  quantity = params[:quantity].present? ? params[:quantity].to_i : 1
  delivery_time_slot_id = params.dig(:order, :delivery_time_slot_id)  # Add this line

  if !quantity.between?(1, 2_147_483_647)
    @order.errors.add(:base, t('spree.please_enter_reasonable_quantity'))
  else
    begin
      @line_item = @order.contents.add(variant, quantity, delivery_time_slot_id: delivery_time_slot_id)  # Pass delivery_time_slot_id
    rescue ActiveRecord::RecordInvalid => error
      @order.errors.add(:base, error.record.errors.full_messages.join(", "))
    end
  end

  respond_to do |format|
    format.html do
      if @order.errors.any?
        flash[:error] = @order.errors.full_messages.join(", ")
        redirect_back_or_default(root_path)
        return
      else
        redirect_to cart_path
      end
    end
  end
end


  private

def line_item_params
    params.require(:line_item).permit(:quantity, :variant_id, :delivery_time_slot_id)  # Add :delivery_time_slot_id
  end
  def store_guest_token
    cookies.permanent.signed[:guest_token] = params[:token] if params[:token]
  end
end
