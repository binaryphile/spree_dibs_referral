Spree::OrdersController.class_eval do
  private
    def check_authorization
      debugger
      session[:access_token] ||= params[:token]
      request_order =  Spree::Order.find_by_number(params[:id])
      order = current_order

      if request_order.nil? and order.nil?
        authorize! :create, Spree::Order.new
      else
        if request_order.nil?
          authorize! :edit, order, session[:access_token]
        else
          if request_order.user == current_user
            authorize! :edit, request_order, session[:access_token]
          else
            authorize! :create, Spree::Order.new
            dibs_clone request_order
          end
        end
      end
    end

    def dibs_clone(order)
      debugger
      my_order = current_order(true)
      my_order.line_items.destroy_all
      order.line_items.each do |line_item|
        new_order.add_variant(line_item.variant, line_item.quantity)
      end
      my_order.dibs_referral = order.user
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
