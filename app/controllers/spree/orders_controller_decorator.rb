Spree::OrdersController.class_eval do
  before_filter :dibs_before, only: :populate
  after_filter :dibs_after, only: :populate

  def dibs_before
    return if !request.get?
    dibs_empty
  end

  def dibs_after
    return if !request.get?
    return if !params.include? :line_item_options
    @order.line_items.each_with_index do |item, index|
      params[:ad_hoc_option_values] = params[:line_item_options]["#{index}"]
      @order.dibs_add_variant(item, ad_hoc_option_value_ids)
    end 
    @order.update!
  end

  def dibs_empty
      @current_order.line_items.destroy_all if @current_order
  end

end
