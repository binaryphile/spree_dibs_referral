Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  match '/dibs-referral', to: 'orders#populate'
  match '/dibs-referral-request', to: 'users#dibs_referral_request'
  match '/dibs-referral-profile', to: 'users#dibs_referral_profile'
end

