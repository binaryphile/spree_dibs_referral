Spree::Order.class_eval do
  belongs_to :dibs_referral, class_name: 'Spree::User'
  attr_accessible :dibs_referral_id
end
