Spree::Order.class_eval do
  belongs_to :dibs_referral, class_name: 'Spree::User'
  attr_accessible :dibs_referral_id

  def dibs_referral_line_items
    result = {}
    result[:variants] = {}
    result[:line_item_options] = []
    line_items.each do | item |
      result[:variants][item.variant.id] = item.quantity
      options = {}
      if item.respond_to?(:ad_hoc_option_values) and item.ad_hoc_option_values and !item.ad_hoc_option_values.empty?
        item.ad_hoc_option_values.each do | option |
          options[option.ad_hoc_option_type.id] = option.id
        end
      end
      result[:line_item_options] << options
    end
    result
  end
end
