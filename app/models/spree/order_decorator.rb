Spree::Order.class_eval do
  belongs_to :dibs_referral, class_name: 'Spree::User'
  attr_accessible :dibs_referral_id

  def dibs_referral_line_items
    result = {}
    result[:products] = {}
    result[:quantity] = {}
    result[:line_item_options] = {}
    line_items.each_with_index do |item, index|
      result[:products][index] = item.variant.id
      result[:quantity][item.variant.id] = item.quantity
      options = {}
      if item.respond_to?(:ad_hoc_option_values) and item.ad_hoc_option_values and !item.ad_hoc_option_values.empty?
        item.ad_hoc_option_values.each do | option |
          options[option.ad_hoc_option_type.id] = option.id
        end
      end
      result[:line_item_options][index] = options
    end
    result
  end

  def dibs_add_variant(item, ad_hoc_option_values)
    item.ad_hoc_option_values = ad_hoc_option_values.map { |cid| Spree::AdHocOptionValue.find(cid) }
    item.price = item.variant.price + item.ad_hoc_option_values.map(&:price_modifier).compact.sum
    item.save
  end

  def contains?(variant, ad_hoc_option_value_ids, product_customizations)
    debugger
    nil
  end
end
