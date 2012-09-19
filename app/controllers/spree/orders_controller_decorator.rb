Spree::OrdersController.class_eval do
  private
    def check_authorization
      #debugger
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
      new_order = current_order(true)
      new_order.line_items.destroy_all
      order.line_items.each do |line_item|
        new_order.add_variant(line_item.variant, line_item.quantity)
      end
      new_order.dibs_referral = order.user
      new_order
    end
end
