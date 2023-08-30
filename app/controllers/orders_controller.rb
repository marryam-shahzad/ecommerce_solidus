class OrdersController < StoreController
  helper 'spree/products', 'orders'

  respond_to :html

  before_action :store_guest_token

  def new
    @order = Order.new
    render 'select_delivery_time_slot'
  end

  def create
    @order = Order.new(order_params)
    # @order.delivery_time_slot = DeliveryTimeSlot.find(params[:order][:delivery_time_slot_id])

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

 def update_shipping_methods
    selected_day = params[:selected_day]

    # Logic to fetch shipping methods based on the selected day
    @shipping_rates = fetch_shipping_rates(selected_day)

    render partial: 'shipping_methods', locals: { shipping_rates: @shipping_rates, selected_day: selected_day }
  end
  def show
    @order = Spree::Order.find_by!(number: params[:id])
    authorize! :show, @order, cookies.signed[:guest_token]
  end

  def submit
    selected_shipping_rate_id = params.dig(:order, :selected_shipping_rate_id)

    # Now you have the selected shipping rate ID, you can proceed with your logic
    # for the order submission and processing.
  end

def shipping_rates_for_today
    # Fetch shipping rates for today
  end

  def shipping_rates_for_tomorrow
    # Fetch shipping rates for tomorrow
  end

  def cancel
    order = Spree::Order.find(params[:id])

    if order.shipments.any?(&:ready?)
      flash[:error] = 'Cannot cancel order because the shipment is ready.'
    elsif order.cancel
      flash[:success] = 'Order has been cancelled.'
    else
      flash[:error] = 'Failed to cancel the order.'
    end

    redirect_to order_path(order)
  end

  def select_delivery_time_slot
    @order = Spree::Order.find(params[:id])
    @available_time_slots = DeliveryTimeSlot.where('available_slots > 0')
  end

  def update_delivery_time_slot
    @order = Spree::Order.find(params[:id])
    @delivery_time_slot = DeliveryTimeSlot.find(params[:order][:delivery_time_slot_id])

    if @order.update(delivery_time_slot: @delivery_time_slot)
      flash[:success] = 'Delivery time slot updated.'
      redirect_to order_path(@order)
    else
      @available_time_slots = DeliveryTimeSlot.where('available_slots > 0')
      render :select_delivery_time_slot
    end
  end

  private

 def order_params
    # params.require(:order).permit()
    # params.require(:order).permit(:other_attributes, :selected_shipping_day, :selected_shipping_rate_id, :other_order_params)
    params.require(:order).permit(:other_attributes, :selected_shipping_day, :selected_shipping_rate_id, :other_order_params)
  end
  def accurate_title
    t('spree.order_number', number: @order.number)
  end

  def store_guest_token
    cookies.permanent.signed[:guest_token] = params[:token] if params[:token]
  end
end
