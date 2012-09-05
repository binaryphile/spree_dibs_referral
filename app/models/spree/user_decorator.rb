module Spree
  User.class_eval do
    scope :dibs_referrers, lambda { includes(:roles).where("#{::Spree::Role.table_name}.name" => "dibs_referral") }
    has_many :dibs_referrals, class_name: '::Spree::Order', uniq: true
  end
end
