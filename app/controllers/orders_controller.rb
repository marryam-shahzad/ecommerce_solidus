# frozen_string_literal: true

class OrdersController < StoreController
  helper 'spree/products', 'orders'

  respond_to :html

  before_action :store_guest_token

  def show
    @order = Spree::Order.find_by!(number: params[:id])
    authorize! :show, @order, cookies.signed[:guest_token]
  end

 # def cancel
 #    # Add your cancellation logic here
 #    # For example, mark the order as cancelled and redirect
 #    order = Spree::Order.find(params[:id])
 #    if order.cancel
 #      flash[:success] = 'Order has been cancelled.'
 #    else
 #      flash[:error] = 'Unable to cancel the order.'
 #    end
 #    redirect_to order_path(order)
 #  end


   def cancel
    order = Spree::Order.find(params[:id])

    # if order.shipment.ready?
    if order.shipments.any?(&:ready?)
      flash[:error] = 'Cannot cancel order because the shipment is ready.'
    elsif order.cancel
      flash[:success] = 'Order has been cancelled.'
    else
      flash[:error] = 'Failed to cancel the order.'
    end

    redirect_to order_path(order)
  end
  private

  def accurate_title
    t('spree.order_number', number: @order.number)
  end

  def store_guest_token
    cookies.permanent.signed[:guest_token] = params[:token] if params[:token]
  end


end
