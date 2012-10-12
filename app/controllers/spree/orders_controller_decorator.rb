Spree::OrdersController.class_eval do
  before_filter :dibs_edit, only: :edit

  def dibs_edit
    if params[:id] and params[:token]
      request_order = Spree::Order.find_by_number(params[:id])
      if request_order and authorize!(:edit, request_order, params[:token])
        if request_order.user == current_user
          @current_order = request_order
        else
          @current_order = dibs_clone request_order
        end
      end
    end
  end

  private
    def dibs_clone(order)
      my_order = new_order
      my_order.line_items.destroy_all
      order.line_items.each do |line_item|
        my_order.add_variant(line_item.variant, line_item.quantity)
      end
      my_order.dibs_referral = order.user
      my_order.save
      session[:order_id] = my_order.id
      my_order
    end

    def new_order
      @current_order = Spree::Order.new
      before_save_new_order
      @current_order.save!
      after_save_new_order
      @current_order
    end
end
