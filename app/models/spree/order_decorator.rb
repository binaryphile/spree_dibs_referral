Spree::Order.class_eval do
  belongs_to :dibs_referral, class_name: 'Spree::User'
  attr_accessible :dibs_referral_id

  def dibs_referral_line_items
    line_items.inject({}) { |result, item| result.update("variants[#{item.variant.id}]" => item.quantity) }
  end
end
