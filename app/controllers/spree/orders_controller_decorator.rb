Spree::OrdersController.class_eval do
  before_filter :dibs_empty, only: :populate

  def dibs_empty
    if request.get?
      if @current_order
        @current_order.line_items.destroy_all
      end
    end
  end

end
