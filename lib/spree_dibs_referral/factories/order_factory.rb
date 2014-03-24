FactoryGirl.define do
  factory :order do
    factory :order_with_referral do
      referral
    end
  end

  factory :user, aliases: [:referral] do
  end
end
